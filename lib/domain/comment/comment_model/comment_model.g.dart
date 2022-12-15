// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['_id'] as String?,
      userid: json['userid'] as String?,
      commenttext: json['commenttext'] as String?,
      postid: json['postid'] as String?,
      commenttime: json['commenttime'] == null
          ? null
          : DateTime.parse(json['commenttime'] as String),
      like: (json['like'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dislike: json['dislike'] as List<dynamic>?,
      subcomments: (json['subcomments'] as List<dynamic>?)
          ?.map((e) => Subcomment.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userid': instance.userid,
      'commenttext': instance.commenttext,
      'postid': instance.postid,
      'commenttime': instance.commenttime?.toIso8601String(),
      'like': instance.like,
      'dislike': instance.dislike,
      'subcomments': instance.subcomments,
      '__v': instance.v,
    };
