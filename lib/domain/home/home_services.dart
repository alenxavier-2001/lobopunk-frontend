import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';

abstract class HomeServices {
  //get userinterested posts
  Future<Either<MainFailure, PostsPageModel>> getuserinterestedposts();
}
