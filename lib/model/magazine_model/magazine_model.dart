// To parse this JSON data, do
//
//     final magazineModel = magazineModelFromJson(jsonString);

import 'dart:convert';

MagazineModel magazineModelFromJson(String str) => MagazineModel.fromJson(json.decode(str));

String magazineModelToJson(MagazineModel data) => json.encode(data.toJson());

class MagazineModel {
  List<Magazine> magazines = [];

  MagazineModel({
    required this.magazines,
  });

  factory MagazineModel.fromJson(Map<dynamic, dynamic> json) => MagazineModel(
    magazines: List<Magazine>.from(json["magazines"].map((x) => Magazine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "magazines": List<dynamic>.from(magazines.map((x) => x.toJson())),
  };
}

class Magazine {
  int id;
  dynamic image;
  String name;
  String author;
  String title;
  String description;
  DateTime datesend;
  DateTime createdAt;
  DateTime updatedAt;

  Magazine({
    required this.id,
    this.image,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.datesend,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Magazine.fromJson(Map<dynamic, dynamic> json) => Magazine(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    author: json["author"],
    title: json["title"],
    description: json["description"],
    datesend: DateTime.parse(json["datesend"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "author": author,
    "title": title,
    "description": description,
    "datesend": "${datesend.year.toString().padLeft(4, '0')}-${datesend.month.toString().padLeft(2, '0')}-${datesend.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
