// // To parse this JSON data, do
// //
// //     final topNotificationModel = topNotificationModelFromJson(jsonString);
//
// import 'dart:convert';
//
// TopNotificationModel topNotificationModelFromJson(String str) => TopNotificationModel.fromJson(json.decode(str));
//
// String topNotificationModelToJson(TopNotificationModel data) => json.encode(data.toJson());
//
// class TopNotificationModel {
//   int id;
//   String name;
//   String description;
//
//   TopNotificationModel({
//     required this.id,
//     required this.name,
//     required this.description,
//   });
//
//   factory TopNotificationModel.fromJson(Map<dynamic, dynamic> json) => TopNotificationModel(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "description": description,
//   };
// }
// To parse this JSON data, do
//
//     final topNotificationModel = topNotificationModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final topNotificationModel = topNotificationModelFromJson(jsonString);

import 'dart:convert';

TopNotificationModel topNotificationModelFromJson(String str) => TopNotificationModel.fromJson(json.decode(str));

String topNotificationModelToJson(TopNotificationModel data) => json.encode(data.toJson());

class TopNotificationModel {
  List<Notofocation> notofocations;

  TopNotificationModel({
    required this.notofocations,
  });

  factory TopNotificationModel.fromJson(Map<dynamic, dynamic> json) => TopNotificationModel(
    notofocations: List<Notofocation>.from(json["notofocations"].map((x) => Notofocation.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "notofocations": List<dynamic>.from(notofocations.map((x) => x.toJson())),
  };
}

class Notofocation {
  int id;
  String name;
  String description;

  Notofocation({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Notofocation.fromJson(Map<dynamic, dynamic> json) => Notofocation(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

