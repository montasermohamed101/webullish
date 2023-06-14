

class RegisterResponse {
  RegisterResponse({
      this.status, 
      this.message, 
      this.user,
     this.errors,
  });

  RegisterResponse.fromJson(dynamic json) {
    print(json['errors']);
    print('===============');
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? status;
  String? message;
  User? user;
  List<dynamic>? errors;
RegisterResponse copyWith({  bool? status,
  String? message,
  User? user,
}) => RegisterResponse(  status: status ?? this.status,
  message: message ?? this.message,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['errors'] = errors;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}



class User {
  User({
      this.name, 
      this.email, 
      this.country, 
      this.type, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    country = json['country'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? country;
  dynamic type;
  String? updatedAt;
  String? createdAt;
  num? id;
User copyWith({  String? name,
  String? email,
  String? country,
  dynamic type,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => User(  name: name ?? this.name,
  email: email ?? this.email,
  country: country ?? this.country,
  type: type ?? this.type,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<dynamic, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['country'] = country;
    map['type'] = type;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}