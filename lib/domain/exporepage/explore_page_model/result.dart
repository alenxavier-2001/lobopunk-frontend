import 'package:json_annotation/json_annotation.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String? hashtag;
  List<PostModel>? posts;

  Result({this.hashtag, this.posts});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
