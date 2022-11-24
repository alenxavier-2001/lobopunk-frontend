import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String? userid;
  String? highvideourl;
  String? midvideourl;
  String? lowvideourl;
  String? thumbnailurl;
  String? description;
  List<String>? hashtags;
  String? posttime;
  bool? public;
  List<dynamic>? repost;
  List<dynamic>? mentions;
  List<dynamic>? like;
  List<dynamic>? dislike;
  List<dynamic>? comments;
  @JsonKey(name: '_id')
  String? id;
  List<dynamic>? report;
  @JsonKey(name: '__v')
  int? v;

  PostModel({
    this.userid,
    this.highvideourl,
    this.midvideourl,
    this.lowvideourl,
    this.thumbnailurl,
    this.description,
    this.hashtags,
    this.posttime,
    this.public,
    this.repost,
    this.mentions,
    this.like,
    this.dislike,
    this.comments,
    this.id,
    this.report,
    this.v,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
