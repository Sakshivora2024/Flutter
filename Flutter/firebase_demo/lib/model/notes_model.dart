// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  String? id;
  String? userId;
  String? title;
  String? description;

  NotesModel({
    this.id,
    this.userId,
    this.title,
    this.description,
  });

  factory NotesModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data();
    return NotesModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
    "description": description,
  };
}
