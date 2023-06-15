class LoginModel{
  String email;
  String password;

  LoginModel({required this.email,required this.password});

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) {
    return LoginModel(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

//
}