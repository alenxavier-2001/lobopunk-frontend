// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hastag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HashtagModel _$HashtagModelFromJson(Map<String, dynamic> json) => HashtagModel(
      id: json['_id'] as String?,
      hashtag: json['hashtag'] as String?,
      count: json['count'] as int?,
      posts:
          (json['posts'] as List<dynamic>?)?.map((e) => e as String).toList(),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$HashtagModelToJson(HashtagModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hashtag': instance.hashtag,
      'count': instance.count,
      'posts': instance.posts,
      '__v': instance.v,
    };
