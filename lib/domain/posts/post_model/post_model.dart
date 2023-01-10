import 'package:json_annotation/json_annotation.dart';
import 'package:lobopunk/domain/posts/post_model/repost/repost.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  bool? isrepost;
  @JsonKey(name: '_id')
  String? id;
  String? userid;
  String? highvideourl;
  String? midvideourl;
  String? lowvideourl;
  String? thumbnailurl;
  String? description;
  List<String>? hashtags;
  String? posttype;
  String? posttime;
  bool? public;
  String? pastpost;
  String? nextpost;
  Repost? repost;
  List<dynamic>? mentions;
  List<String>? like;
  List<dynamic>? dislike;
  List<dynamic>? comments;
  List<dynamic>? report;
  @JsonKey(name: '__v')
  int? v;
  List<String>? repostlist;

  PostModel({
    this.isrepost,
    this.id,
    this.userid,
    this.highvideourl,
    this.midvideourl,
    this.lowvideourl,
    this.thumbnailurl,
    this.description,
    this.hashtags,
    this.posttype,
    this.posttime,
    this.public,
    this.pastpost,
    this.nextpost,
    this.repost,
    this.mentions,
    this.like,
    this.dislike,
    this.comments,
    this.report,
    this.v,
    this.repostlist,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
