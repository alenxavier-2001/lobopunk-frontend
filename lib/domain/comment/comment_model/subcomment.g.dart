// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcomment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcomment _$SubcommentFromJson(Map<String, dynamic> json) => Subcomment(
      userid: json['userid'] as String?,
      commenttext: json['commenttext'] as String?,
      like: json['like'] as List<dynamic>?,
      dislike: json['dislike'] as List<dynamic>?,
      commenttime: json['commenttime'] == null
          ? null
          : DateTime.parse(json['commenttime'] as String),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SubcommentToJson(Subcomment instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'commenttext': instance.commenttext,
      'like': instance.like,
      'dislike': instance.dislike,
      'commenttime': instance.commenttime?.toIso8601String(),
      '_id': instance.id,
    };
