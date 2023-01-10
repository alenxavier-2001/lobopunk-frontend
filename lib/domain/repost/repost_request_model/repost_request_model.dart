import 'package:json_annotation/json_annotation.dart';

part 'repost_request_model.g.dart';

@JsonSerializable()
class RepostRequestModel {
  String? postid;
  String? thumbnail;
  String? originaluserid;
  String? repostuserid;
  bool? approvalstatus;
  DateTime? time;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: '__v')
  int? v;

  RepostRequestModel({
    this.postid,
    this.thumbnail,
    this.originaluserid,
    this.repostuserid,
    this.approvalstatus,
    this.time,
    this.id,
    this.v,
  });

  factory RepostRequestModel.fromJson(Map<String, dynamic> json) {
    return _$RepostRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepostRequestModelToJson(this);
}
