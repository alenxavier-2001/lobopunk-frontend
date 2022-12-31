import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/hashtags/hastag_model/hastag_model.dart';

abstract class HashtagsServices {
  Future<Either<MainFailure, List<HashtagModel>>> getHashtags();
}
