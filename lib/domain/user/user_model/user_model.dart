import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  List<dynamic>? favaccounts;
  List<dynamic>? favhashtags;
  List<dynamic>? reposts;
  List<dynamic>? repostsentrequests;
  List<dynamic>? repostreceivedrequests;
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? name;
  String? email;
  String? password;
  String? bio;
  String? phonenumber;
  String? profileimage;
  List<String>? socailmedialinks;
  List<String>? punkers;
  List<String>? punking;
  String? profiletheme;
  String? thememusic;
  int? totallikes;
  List<String>? likedposts;
  List<dynamic>? savedposts;
  List<String>? myposts;
  List<dynamic>? notification;
  List<dynamic>? report;
  @JsonKey(name: '__v')
  int? v;
  bool? isverified;

  UserModel({
    this.favaccounts,
    this.favhashtags,
    this.reposts,
    this.repostsentrequests,
    this.repostreceivedrequests,
    this.id,
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
    this.report,
    this.v,
    this.isverified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
