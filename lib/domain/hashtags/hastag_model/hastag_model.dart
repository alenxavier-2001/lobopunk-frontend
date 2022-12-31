import 'package:json_annotation/json_annotation.dart';

part 'hastag_model.g.dart';

@JsonSerializable()
class HashtagModel {
  @JsonKey(name: '_id')
  String? id;
  String? hashtag;
  int? count;
  List<String>? posts;
  @JsonKey(name: '__v')
  int? v;

  HashtagModel({this.id, this.hashtag, this.count, this.posts, this.v});

  factory HashtagModel.fromJson(Map<String, dynamic> json) {
    return _$HashtagModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HashtagModelToJson(this);
}
