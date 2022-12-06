import 'package:json_annotation/json_annotation.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

part 'posts_page_model.g.dart';

@JsonSerializable()
class PostsPageModel {
  int? page;
  List<PostModel>? results;

  PostsPageModel({this.page, this.results});

  factory PostsPageModel.fromJson(Map<String, dynamic> json) {
    return _$PostsPageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostsPageModelToJson(this);
}
