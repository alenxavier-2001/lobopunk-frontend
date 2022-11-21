import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';

abstract class AccountService {
  Future<Either<MainFailure, UserModel>> getUseData();
}
