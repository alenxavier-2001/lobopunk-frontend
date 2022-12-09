import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/post_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: PostService)
class PostImplementation implements PostService {
  @override
  Future<Either<MainFailure, PostModel>> dislikePost(
      String postid, int index) async {
    try {
      PostModel newModel = postListNotifier.value[index];

      newModel.dislike!.add(constusermodel.id);
      newModel.like!.contains(constusermodel.id)
          ? newModel.like!.remove(constusermodel.id)
          : null;
      postListNotifier.value = List.from(postListNotifier.value)
        ..replaceRange(index, index + 1, [newModel]);
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.dislikepost);
      var body = {"postid": postid};
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = PostModel.fromJson(jsonDecode(response.body));
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
  Future<Either<MainFailure, PostModel>> likePost(
      String postid, int index) async {
    try {
      log(postListNotifier.value[index].like.toString());
      PostModel newModel = postListNotifier.value[index];

      newModel.like!.add(constusermodel.id);
      newModel.dislike!.contains(constusermodel.id)
          ? newModel.dislike!.remove(constusermodel.id)
          : null;
      postListNotifier.value = List.from(postListNotifier.value)
        ..replaceRange(index, index + 1, [newModel]);
      log(postListNotifier.value[index].like.toString());
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.likepost);
      var body = {"postid": postid};
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = PostModel.fromJson(jsonDecode(response.body));
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
