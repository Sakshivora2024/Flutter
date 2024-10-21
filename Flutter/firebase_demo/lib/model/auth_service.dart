import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/model/notes_model.dart';
import 'package:firebase_demo/model/registration_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // static final AuthService auth = AuthService._internal();
  // // final FirebaseAuth authService = FirebaseAuth.instance;
  //
  // AuthService._internal();
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("user");

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(authCredential);
    return FirebaseAuth.instance.currentUser;
  }

  Future<RegistrationModel?> registration(
      {required String email,
      required String password,
      required String? name,
      required String? age,
      required File image}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        var imageName = firebaseUser.uid;
        var storageRef = FirebaseStorage.instance.ref().child('images/$imageName');
        var uploadTask = storageRef.putFile(image);
        var downloadUrl = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
        if (downloadUrl.isNotEmpty) {
          // FirebaseFirestore.instance
          //     .collection('authentication')
          //     .doc(firebaseUser.uid)
          //     .set({
          //   "id": firebaseUser.uid,
          //   "name": name,
          //   "age": age,
          //   "password": password,
          //   "email": email,
          //   "image": downloadUrl.toString()
          // });

          await ref.child(firebaseUser.uid).set({
            "id":firebaseUser.uid,
            "name": name,
            "password": password,
            "email": email,
            "age":age,
            "image": downloadUrl
          });
        }

      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }



  Future<String?> login(
      String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = userCredential.user;
      return firebaseUser?.uid;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> currentUser() async {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  // Future<List<RegistrationModel>> getData(String? id) async {
  //   final data = await FirebaseFirestore.instance
  //       .collection('authentication')
  //       .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
  //       .get();
  //
  //   final snapData =
  //       data.docs.map((e) => RegistrationModel.fromJson(e)).toList();
  //   return snapData;
  // }

  // Future<List<NotesModel>> getNotesData() async {
  //   // final data = await FirebaseFirestore.instance
  //   //     .collection('authentication')
  //   //     .doc(FirebaseAuth.instance.currentUser?.uid)
  //   //     .collection('notes')
  //   //     .get();
  //   final data = ref.child(FirebaseAuth.instance.currentUser?.uid ?? "").onValue.map((entry){
  //     final value = entry.snapshot.value as Map<String,dynamic>;
  //     final snapData = value.map((e) => NotesModel.fromJson(e)).toList();
  //   });
  //
  //   // return data;
  // }

  Future<void> deleteDate(String id) async {
    final data = await FirebaseFirestore.instance
        .collection('authentication')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes')
        .doc(id);
    await data.delete().whenComplete(() => print("Deleted an item"));
  }

  Future<NotesModel?> addNotes(String title, String description) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('authentication')
          .doc(FirebaseAuth.instance.currentUser?.uid);
      final notes = await user
          .collection('notes')
          .doc(DateTime.now().millisecondsSinceEpoch.toString())
          .set({
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "userId": FirebaseAuth.instance.currentUser?.uid,
        "title": title,
        "description": description
      });
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NotesModel?> updateNotes(
      String title, String description, String id) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('authentication')
          .doc(FirebaseAuth.instance.currentUser?.uid);
      final notes = await user
          .collection('notes')
          .doc(id)
          .update({"title": title, "description": description});
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NotesModel?> updateProfile(String name, String age, String email,
      String password, File image) async {
    try {
      var imageName = FirebaseAuth.instance.currentUser?.uid;
      var storageRef =
          FirebaseStorage.instance.ref().child('images/$imageName');
      var uploadTask = storageRef.putFile(image);
      var downloadUrl =
          await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
      await ref.child(FirebaseAuth.instance.currentUser?.uid ?? "").update({
        "name": name,
        "age": age,
        "email": email,
        "password": password,
        "image": downloadUrl.toString()
      });
      // final user = await FirebaseFirestore.instance
      //     .collection('authentication')
      //     .doc(FirebaseAuth.instance.currentUser?.uid)
      //     .update({
      //   "name": name,
      //   "age": age,
      //   "email": email,
      //   "password": password,
      //   "image": downloadUrl.toString()
      // });
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
