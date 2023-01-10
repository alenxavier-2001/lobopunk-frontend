import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/repost/repost_request_model/repost_request_model.dart';

abstract class PostService {
  Future<Either<MainFailure, PostModel>> likePost(
      String postid, int index, bool ispost2);
  Future<Either<MainFailure, PostModel>> dislikePost(
      String postid, int index, bool ispost2);
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

  //rePostRequest a post
  Future<Either<MainFailure, RepostRequestModel>> rePostRequest(
    Map<String, dynamic> data,
  );
  Future<PostsPageModel> getRepostlist(
    String postid,
  );
  Future<Either<MainFailure, PostModel>> rePostDelete(
    Map<String, dynamic> data,
  );
  //split the repost

  Future<Either<MainFailure, PostModel>> splitPost(Map<String, dynamic> data);
}
