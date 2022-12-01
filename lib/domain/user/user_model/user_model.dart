import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? token;
  String? username;
  String? name;
  String? email;
  String? password;
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
  @JsonKey(name: '__v')
  int? v;

  UserModel({
    this.token,
    this.username,
    this.name,
    this.email,
    this.password,
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
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
