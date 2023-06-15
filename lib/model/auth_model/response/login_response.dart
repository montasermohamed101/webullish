// // To parse this JSON data, do
// //
// //     final loginResponse = loginResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:webullish/model/auth_model/request/login_model.dart';
// import 'package:webullish/model/auth_model/response/register_response.dart';
//
// LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
//
// String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
//
// class LoginResponse {
//   String token;
//   User? user;
//
//   LoginResponse({
//     required this.token,
//     required this.user,
//   });
//
//   factory LoginResponse.fromJson(Map<dynamic, dynamic> json) => LoginResponse(
//     token: json["token"],
//     user: User.fromJson(json["user"]),
//   );
//
//   Map<dynamic, dynamic> toJson() => {
//     "token": token,
//     "user": user!.toJson(),
//   };
// }
//
// /*
//
// "user": {
//         "name": "omar",
//         "email": "theghost3011f24512@gmail.com",
//         "country": "syria",
//         "type": null,
//         "updated_at": "2023-06-13T19:49:17.000000Z",
//         "created_at": "2023-06-13T19:49:17.000000Z",
//         "id": 66
//     }
//  */
//
//
// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int? code;
  String? message;

  LoginResponse({
    required this.code,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) => LoginResponse(
    code: json["code"],
    message: json["message"],
  );

  Map<dynamic, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
