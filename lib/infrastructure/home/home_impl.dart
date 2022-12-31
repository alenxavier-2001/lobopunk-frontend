import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/home/home_services.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: HomeServices)
class HomeImplementation implements HomeServices {
  @override
  Future<Either<MainFailure, PostsPageModel>> getuserinterestedposts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("${ApiEndPoints.getuserinterestedposts}0/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = PostsPageModel.fromJson(jsonDecode(response.body));

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
}
