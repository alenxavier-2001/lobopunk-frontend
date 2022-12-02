import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? username;
  String? name;
  String? email;

  String? bio;
  String? phonenumber;
  String? profileimage;
  List<dynamic>? socailmedialinks;
  List<dynamic>? punkers;
  List<dynamic>? punking;
  String? profiletheme;
  String? thememusic;
  int? totallikes;
  List<dynamic>? likedposts;
  List<dynamic>? savedposts;
  List<dynamic>? myposts;
  List<dynamic>? notification;
  @JsonKey(name: '_id')
  String? id;
  List<dynamic>? report;

  UserModel({
    this.username,
    this.name,
    this.email,
    this.bio,
    this.phonenumber,
    this.profileimage,
    this.socailmedialinks,
    this.punkers,
    this.punking,
    this.profiletheme,
    this.thememusic,
    this.totallikes,
    this.likedposts,
    this.savedposts,
    this.myposts,
    this.notification,
    this.id,
    this.report,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
