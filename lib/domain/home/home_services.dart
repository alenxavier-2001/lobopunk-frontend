import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

abstract class HomeServices {
  Future<Either<MainFailure, PostModel>> getSubscribedPosts();
}
