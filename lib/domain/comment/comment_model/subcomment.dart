import 'package:json_annotation/json_annotation.dart';

part 'subcomment.g.dart';

@JsonSerializable()
class Subcomment {
  String? userid;
  String? commenttext;
  List<dynamic>? like;
  List<dynamic>? dislike;
  DateTime? commenttime;
  @JsonKey(name: '_id')
  String? id;

  Subcomment({
    this.userid,
    this.commenttext,
    this.like,
    this.dislike,
    this.commenttime,
    this.id,
  });

  factory Subcomment.fromJson(Map<String, dynamic> json) {
    return _$SubcommentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubcommentToJson(this);
}
