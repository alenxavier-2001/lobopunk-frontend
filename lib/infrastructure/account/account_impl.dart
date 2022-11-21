import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/account/account_services.dart';

import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: AccountService)
class AccountImplementation implements AccountService {
  @override
  Future<Either<MainFailure, UserModel>> getUseData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.getuserdata);
      final response = await http.get(
        url,
        headers: <String, String>{'x-auth-token': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(jsonDecode(response.body));
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
