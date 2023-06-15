
import 'dart:convert';

FollowUsPagesModel followUsPagesModelFromJson(String str) => FollowUsPagesModel.fromJson(json.decode(str));

String followUsPagesModelToJson(FollowUsPagesModel data) => json.encode(data.toJson());

class FollowUsPagesModel {
  int? id;
  String? facebook;
  String? youtube;
  String? instagram;
  String? linkedin;
  String? twitter;

  FollowUsPagesModel({
     this.id,
     this.facebook,
     this.youtube,
     this.instagram,
     this.linkedin,
     this.twitter,
  });
  String? getUrl(String platformName) {
    switch (platformName) {
      case 'facebook':
        return facebook;
      case 'twitter':
        return twitter;
      case 'instagram':
        return instagram;
      case 'youtube':
        return youtube;
      case 'linkedin':
        return linkedin;
    // ... add cases for other social media platforms ...
      default:
        return null;
    }
  }
  factory FollowUsPagesModel.fromJson(Map<dynamic, dynamic> json) => FollowUsPagesModel(
    id: json["id"],
    facebook: json["facebook"],
    youtube: json["youtube"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    twitter: json["twitter"],
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "facebook": facebook,
    "youtube": youtube,
    "instagram": instagram,
    "linkedin": linkedin,
    "twitter": twitter,
  };

}
