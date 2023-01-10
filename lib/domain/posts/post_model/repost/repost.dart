import 'package:json_annotation/json_annotation.dart';

part 'repost.g.dart';

@JsonSerializable()
class Repost {
  String? postid;
  String? userid;

  Repost({this.postid, this.userid});

  factory Repost.fromJson(Map<String, dynamic> json) {
    return _$RepostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepostToJson(this);
}
