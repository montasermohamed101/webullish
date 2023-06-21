import 'dart:convert';
/// notifications : [{"id":1,"number":10,"name":"sell","image":"1686250351.jpg","video":null,"description":"old motification","datesend":"2023-06-06","created_at":"2023-06-08T09:52:31.000000Z","updated_at":"2023-06-08T09:52:31.000000Z"},{"id":2,"number":10,"name":"sell","image":null,"video":null,"description":"old motification","datesend":"2023-06-06","created_at":"2023-06-11T14:06:02.000000Z","updated_at":"2023-06-11T14:06:02.000000Z"},{"id":3,"number":10,"name":"sell","image":null,"video":null,"description":"old motification","datesend":"2023-06-06","created_at":"2023-06-11T14:06:14.000000Z","updated_at":"2023-06-11T14:06:14.000000Z"},{"id":5,"number":10,"name":"sell","image":null,"video":null,"description":"old motification","datesend":"2023-06-06","created_at":"2023-06-11T14:06:53.000000Z","updated_at":"2023-06-11T14:06:53.000000Z"}]

SwingAlertsModel swingAlertsFromJson(String str) => SwingAlertsModel.fromJson(json.decode(str));
String swingAlertsToJson(SwingAlertsModel data) => json.encode(data.toJson());
class SwingAlertsModel {
  SwingAlertsModel({
      this.notifications,});

  SwingAlertsModel.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  List<Notifications>? notifications;
SwingAlertsModel copyWith({  List<Notifications>? notifications,
}) => SwingAlertsModel(  notifications: notifications ?? this.notifications,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// number : 10
/// name : "sell"
/// image : "1686250351.jpg"
/// video : null
/// description : "old motification"
/// datesend : "2023-06-06"
/// created_at : "2023-06-08T09:52:31.000000Z"
/// updated_at : "2023-06-08T09:52:31.000000Z"

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));
String notificationsToJson(Notifications data) => json.encode(data.toJson());
class Notifications {
  Notifications({
      this.id, 
      this.number, 
      this.name, 
      this.image, 
      this.video, 
      this.description, 
      this.datesend, 
      this.createdAt, 
      this.updatedAt,});

  Notifications.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    description = json['description'];
    datesend = json['datesend'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? number;
  String? name;
  String? image;
  dynamic video;
  String? description;
  String? datesend;
  String? createdAt;
  String? updatedAt;
Notifications copyWith({  num? id,
  num? number,
  String? name,
  String? image,
  dynamic video,
  String? description,
  String? datesend,
  String? createdAt,
  String? updatedAt,
}) => Notifications(  id: id ?? this.id,
  number: number ?? this.number,
  name: name ?? this.name,
  image: image ?? this.image,
  video: video ?? this.video,
  description: description ?? this.description,
  datesend: datesend ?? this.datesend,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['name'] = name;
    map['image'] = image;
    map['video'] = video;
    map['description'] = description;
    map['datesend'] = datesend;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}