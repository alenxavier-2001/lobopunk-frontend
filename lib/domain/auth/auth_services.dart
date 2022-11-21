import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/auth/auth_model/auth_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

abstract class AuthService {
  Future<Either<MainFailure, bool>> checkUsername(String username);
  Future<Either<MainFailure, AuthModel>> signup(Map data);
  Future<Either<MainFailure, AuthModel>> signin(Map data);
  Future<Either<MainFailure, bool>> tokenValidation(String token);
  Future<Either<MainFailure, bool>> signOut();
}
