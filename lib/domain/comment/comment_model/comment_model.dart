import 'package:json_annotation/json_annotation.dart';

import 'subcomment.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  @JsonKey(name: '_id')
  String? id;
  String? userid;
  String? commenttext;
  String? postid;
  DateTime? commenttime;
  List<String>? like;
  List<dynamic>? dislike;
  List<Subcomment>? subcomments;
  @JsonKey(name: '__v')
  int? v;

  CommentModel({
    this.id,
    this.userid,
    this.commenttext,
    this.postid,
    this.commenttime,
    this.like,
    this.dislike,
    this.subcomments,
    this.v,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return _$CommentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
