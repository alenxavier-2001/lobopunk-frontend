import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

abstract class PostService {
  Future<Either<MainFailure, PostModel>> likePost(String postid, int index);
  Future<Either<MainFailure, PostModel>> dislikePost(String postid, int index);
}
