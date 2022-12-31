// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExplorePageModel _$ExplorePageModelFromJson(Map<String, dynamic> json) =>
    ExplorePageModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExplorePageModelToJson(ExplorePageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
