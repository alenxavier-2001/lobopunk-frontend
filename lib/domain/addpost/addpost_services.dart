import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';

abstract class AddPostService {
  Future<Either<MainFailure, File>> addPostVideo();
  Future<Either<MainFailure, File>> getVideoThumbnail(File file);
  Future<Map<String, dynamic>> uploadPostVideo(File file);
  Future<Either<MainFailure, PostModel>> uploadPostData(Map data);
}
