import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/auth/auth_model/auth_model.dart';

import 'package:lobopunk/domain/auth/auth_services.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:http/http.dart' as http;
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthService)
class AuthImplementation implements AuthService {
  @override
  Future<Either<MainFailure, bool>> checkUsername(String username) async {
    try {
      final url = Uri.parse("${ApiEndPoints.auth}checkusername/$username/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        const result = true;
        return const Right(result);
      } else if (response.statusCode == 300) {
        const result = false;
        return const Right(result);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, AuthModel>> signup(Map data) async {
    try {
      final url = Uri.parse("${ApiEndPoints.auth}signup");
      var body = data;
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AuthModel.fromJson(jsonDecode(response.body));
        return Right(result);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, AuthModel>> signin(Map data) async {
    try {
      final url = Uri.parse("${ApiEndPoints.auth}signin");
      var body = data;
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AuthModel.fromJson(jsonDecode(response.body));
        return Right(result);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> tokenValidation(String token) async {
    try {
      final url = Uri.parse("${ApiEndPoints.auth}tokenIsvalid");

      final response = await http.post(url,
          headers: <String, String>{'x-auth-token': token}, body: {});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);

        return Right(result);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? "";
      token = "";
      await prefs.setString('token', token);
      return right(true);
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }
}
