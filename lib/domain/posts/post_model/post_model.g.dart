// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      isrepost: json['isrepost'] as bool?,
      id: json['_id'] as String?,
      userid: json['userid'] as String?,
      highvideourl: json['highvideourl'] as String?,
      midvideourl: json['midvideourl'] as String?,
      lowvideourl: json['lowvideourl'] as String?,
      thumbnailurl: json['thumbnailurl'] as String?,
      description: json['description'] as String?,
      hashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      posttype: json['posttype'] as String?,
      posttime: json['posttime'] as String?,
      public: json['public'] as bool?,
      pastpost: json['pastpost'] as String?,
      nextpost: json['nextpost'] as String?,
      repost: json['repost'] == null
          ? null
          : Repost.fromJson(json['repost'] as Map<String, dynamic>),
      mentions: json['mentions'] as List<dynamic>?,
      like: (json['like'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dislike: json['dislike'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      report: json['report'] as List<dynamic>?,
      v: json['__v'] as int?,
      repostlist: (json['repostlist'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'isrepost': instance.isrepost,
      '_id': instance.id,
      'userid': instance.userid,
      'highvideourl': instance.highvideourl,
      'midvideourl': instance.midvideourl,
      'lowvideourl': instance.lowvideourl,
      'thumbnailurl': instance.thumbnailurl,
      'description': instance.description,
      'hashtags': instance.hashtags,
      'posttype': instance.posttype,
      'posttime': instance.posttime,
      'public': instance.public,
      'pastpost': instance.pastpost,
      'nextpost': instance.nextpost,
      'repost': instance.repost,
      'mentions': instance.mentions,
      'like': instance.like,
      'dislike': instance.dislike,
      'comments': instance.comments,
      'report': instance.report,
      '__v': instance.v,
      'repostlist': instance.repostlist,
    };
