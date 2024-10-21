import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/authentication/bloc/registration_bloc.dart';
import 'package:firebase_demo/model/auth_service.dart';
import 'package:firebase_demo/model/registration_model.dart';
import 'package:firebase_demo/routes/routes.dart';
import 'package:firebase_demo/widgets/text_form.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  File? _image;
  bool passwordVisible = true;
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  RegExp email = RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
  RegExp password =
      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$");
  RegistrationModel? register;
  bool isUpdate = false;
  final AuthService authService = AuthService();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) {
        updateProfile();
      },
    );
    context.read<RegistrationBloc>().add(RegistrationInitialEvent());
    super.initState();
  }

  updateProfile() async {
    register = ModalRoute.of(context)?.settings.arguments as RegistrationModel?;
    print(register?.password);
    if (register != null) {
      isUpdate = true;
      DataSnapshot snapshot =
          (await authService.ref.child(register?.id ?? "").get());
      Map data = snapshot.value as Map;
      nameController.text = register?.name ?? "";
      ageController.text = register?.age ?? "";
      emailController.text = register?.email ?? "";
      passwordController.text = register?.password ?? "";
      register?.imageFile = register?.imageFile;
      register?.obscureText = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text(
            "Registration",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationLoadedState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RegistrationLoadingSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: registerKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextForm(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextForm(
                          controller: ageController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter age';
                            }
                            return null;
                          },
                          hintText: 'Age',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextForm(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            } else if (!email.hasMatch(value)) {
                              return 'Enter email in valid format';
                            }
                            return null;
                          },
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextForm(
                          hintText: 'Password',
                          controller: passwordController,
                          obscureText: state.registrationModel.obscureText,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<RegistrationBloc>()
                                  .add(RegistrationPasswordEvent());
                            },
                            icon: Icon(state.registrationModel.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Password';
                            } else if (!password.hasMatch(value)) {
                              return 'Enter Password in valid format';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Image',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  final image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (image == null) return;
                                  if (context.mounted) {
                                    context
                                        .read<RegistrationBloc>()
                                        .add(RegistrationImageEvent(image));
                                  }
                                },
                                child: const Text("Select Image")),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(state.registrationModel.imageFile?.path
                                    .toString()
                                    .split('/')
                                    .last ??
                                ""),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (registerKey.currentState?.validate() ??
                                  false) {
                                if (isUpdate == false) {
                                  context.read<RegistrationBloc>().add(
                                      RegistrationSignUpEvent(
                                          emailController.text,
                                          passwordController.text,
                                          nameController.text,
                                          ageController.text,
                                          state.registrationModel.imageFile!));
                                  Navigator.pushNamed(context, Routes.login);
                                } else {
                                  var imageName = register?.id;
                                  var storageRef = FirebaseStorage.instance
                                      .ref()
                                      .child('images/$imageName');
                                  var uploadTask = storageRef.putFile(
                                      state.registrationModel.imageFile!);
                                  var downloadUrl = await (await uploadTask
                                          .whenComplete(() {}))
                                      .ref
                                      .getDownloadURL();
                                  authService.ref
                                      .child(register?.id ?? "")
                                      .update({
                                    "name": nameController.text,
                                    "age": ageController.text,
                                    "password": passwordController.text,
                                    "email": emailController.text,
                                    "image": downloadUrl.toString(),
                                  }).then((_) => Navigator.pop(context));
                                  // context.read<RegistrationBloc>().add(
                                  //     RegistrationUpdateEvent(
                                  //         emailController.text, passwordController.text, ,
                                  //         ageController.text, , register?.id ?? ""));
                                }
                                nameController.clear();
                                ageController.clear();
                                emailController.clear();
                                passwordController.clear();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.tealAccent),
                            child: Text(
                              isUpdate == false ? "Sign up" : "Update",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(color: Colors.teal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pushNamed(
                                          context, Routes.login))
                              ])),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<RegistrationBloc>().add(SignInWithGoogleEvent());
                          },
                          child: Text("Sign In with Google"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.tealAccent,
                              minimumSize: Size(327.w, 44.h)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is RegistrationErrorState) {
              return const Center(
                child: Text("Error........"),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
