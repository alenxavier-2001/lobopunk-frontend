import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/exporepage/explore_page_model/explore_page_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';

abstract class PublicPageServices {
  //publicPage
  Future<Either<MainFailure, ExplorePageModel>> getExplorePage();
  //search users page
  Future<Either<MainFailure, List<UserModel>>> searchUsers(
      {required String data});
}
