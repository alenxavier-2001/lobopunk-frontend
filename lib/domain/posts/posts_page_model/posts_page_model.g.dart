// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsPageModel _$PostsPageModelFromJson(Map<String, dynamic> json) =>
    PostsPageModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostsPageModelToJson(PostsPageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
