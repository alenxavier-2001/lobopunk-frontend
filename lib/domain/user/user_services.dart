import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';

abstract class UserServices {
  Future<Either<MainFailure, UserModel>> uploadProfilePic({required File file});
  Future<Either<MainFailure, UserModel>> editProfile(
      {required Map<String, dynamic> data});

  Future<Either<MainFailure, UserModel>> editSocialLink(
      {required Map<String, dynamic> data});
  Future<Either<MainFailure, PostModel>> editPost(Map<String, dynamic> data);
  Future<Either<MainFailure, PostsPageModel>> getMyPosts();
  Future<Either<MainFailure, Map<String, dynamic>>> getUserName(
      {required String userid});
  Future<Either<MainFailure, UserModel>> getUseData();
}
