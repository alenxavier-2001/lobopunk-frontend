// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      userid: json['userid'] as String?,
      highvideourl: json['highvideourl'] as String?,
      midvideourl: json['midvideourl'] as String?,
      lowvideourl: json['lowvideourl'] as String?,
      thumbnailurl: json['thumbnailurl'] as String?,
      description: json['description'] as String?,
      hashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      posttime: json['posttime'] as String?,
      public: json['public'] as bool?,
      repost: json['repost'] as List<dynamic>?,
      mentions: json['mentions'] as List<dynamic>?,
      like: json['like'] as List<dynamic>?,
      dislike: json['dislike'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      id: json['_id'] as String?,
      report: json['report'] as List<dynamic>?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'userid': instance.userid,
      'highvideourl': instance.highvideourl,
      'midvideourl': instance.midvideourl,
      'lowvideourl': instance.lowvideourl,
      'thumbnailurl': instance.thumbnailurl,
      'description': instance.description,
      'hashtags': instance.hashtags,
      'posttime': instance.posttime,
      'public': instance.public,
      'repost': instance.repost,
      'mentions': instance.mentions,
      'like': instance.like,
      'dislike': instance.dislike,
      'comments': instance.comments,
      '_id': instance.id,
      'report': instance.report,
      '__v': instance.v,
    };
