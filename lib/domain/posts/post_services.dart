import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';

abstract class PostService {
  Future<Either<MainFailure, PostModel>> likePost(String postid, int index);
  Future<Either<MainFailure, PostModel>> dislikePost(String postid, int index);
  Future<String> postShare(String postid);
  Future<Either<MainFailure, PostsPageModel>> continuePost(
      String postid, int pageno);
  Future<Either<MainFailure, PostsPageModel>> getPostbyhashtag(
    String hashtag,
  );
  Future<Either<MainFailure, PostModel>> getPostid(
    String postid,
  );
  //report posts
  Future<Either<MainFailure, PostModel>> reportPost(
      Map<String, dynamic> data, int index);
}
