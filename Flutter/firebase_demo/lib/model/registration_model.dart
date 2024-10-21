// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  String? id;
  String? image;
  String? name;
  String? age;
  String? password;
  String? email;
  File? imageFile;
  bool obscureText;

  RegistrationModel(
      {this.id,
      this.image,
      this.name,
      this.age,
      this.password,
      this.email,
      this.imageFile,
      this.obscureText = true});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    // final data = json.data();
    return RegistrationModel(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      age: json["age"],
      password: json["password"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "age": age,
        "password": password,
        "email": email,
      };
}
