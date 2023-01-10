import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/exporepage/explore_page_model/explore_page_model.dart';
import 'package:lobopunk/domain/publicpage/publicpage_services.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PublicPageServices)
class PublicPageImplementation implements PublicPageServices {
  @override
  Future<Either<MainFailure, ExplorePageModel>> getExplorePage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.getexplorepage);
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ExplorePageModel.fromJson(jsonDecode(response.body));

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

  //search users
  @override
  Future<Either<MainFailure, List<UserModel>>> searchUsers(
      {required String data}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("${ApiEndPoints.searchUsers}$data/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        final List<UserModel> userList = (result['results'] as List).map((e) {
          return UserModel.fromJson(e);
        }).toList();
        // log(userList.length.toString());
        return Right(userList);
      } else {
        log(jsonDecode(response.body));
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }
}
