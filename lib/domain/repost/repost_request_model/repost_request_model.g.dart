// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repost_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepostRequestModel _$RepostRequestModelFromJson(Map<String, dynamic> json) =>
    RepostRequestModel(
      postid: json['postid'] as String?,
      thumbnail: json['thumbnail'] as String?,
      originaluserid: json['originaluserid'] as String?,
      repostuserid: json['repostuserid'] as String?,
      approvalstatus: json['approvalstatus'] as bool?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      id: json['_id'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$RepostRequestModelToJson(RepostRequestModel instance) =>
    <String, dynamic>{
      'postid': instance.postid,
      'thumbnail': instance.thumbnail,
      'originaluserid': instance.originaluserid,
      'repostuserid': instance.repostuserid,
      'approvalstatus': instance.approvalstatus,
      'time': instance.time?.toIso8601String(),
      '_id': instance.id,
      '__v': instance.v,
    };
