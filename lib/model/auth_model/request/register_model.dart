// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? name;
  String? email;
  String? country;
  String? password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.country,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<dynamic, dynamic> json) => RegisterModel(
    name: json["name"],
    email: json["email"],
    country: json["country"],
    password: json["password"],
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "email": email,
    "country": country,
    "password": password,
  };
}



