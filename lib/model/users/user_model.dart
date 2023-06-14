
class UserDM {
  final int? id;
  final String? name;
  final String? email;
  final String? country;

  UserDM({this.id, this.name, this.email, this.country});

  factory UserDM.fromJson(Map<dynamic, dynamic> json) {
    return UserDM(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      country: json['country'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "country": country,
    };
  }
}

