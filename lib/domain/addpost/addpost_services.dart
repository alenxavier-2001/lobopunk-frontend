import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

abstract class AddPostService {
  Future<Either<MainFailure, File>> addPostVideo();
  Future<Map<String, dynamic>> uploadPostVideo(File file);
}
