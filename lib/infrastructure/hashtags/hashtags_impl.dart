import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/hashtags/hashtags_services.dart';
import 'package:lobopunk/domain/hashtags/hastag_model/hastag_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: HashtagsServices)
class HashtagsImplementation implements HashtagsServices {
  @override
  Future<Either<MainFailure, List<HashtagModel>>> getHashtags() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.gethashtags);

      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        final hashtaglist = (result['results'] as List).map((e) {
          return HashtagModel.fromJson(e);
        }).toList();
        return Right(hashtaglist);
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
