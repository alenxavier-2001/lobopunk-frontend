import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'explore_page_model.g.dart';

@JsonSerializable()
class ExplorePageModel {
  int? page;
  List<Result>? results;

  ExplorePageModel({this.page, this.results});

  factory ExplorePageModel.fromJson(Map<String, dynamic> json) {
    return _$ExplorePageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExplorePageModelToJson(this);
}
