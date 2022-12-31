import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/comment/comment_model/comment_model.dart';
import 'package:lobopunk/domain/comment/comment_service.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: CommentServices)
class Commentimplementation implements CommentServices {
  //get functions
  @override
  Future<Either<MainFailure, List<CommentModel>>> getComments(
      String postid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("${ApiEndPoints.getcomment}$postid");

      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        final commentslist = (result['results'] as List).map((e) {
          return CommentModel.fromJson(e);
        }).toList();
        return Right(commentslist);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  //post
  @override
  Future<Either<MainFailure, CommentModel>> postComment(
      Map<String, dynamic> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.commentpost);

      final response = await http.post(url,
          headers: <String, String>{
            // 'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
          body: data);
      log(jsonDecode(response.body).toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));

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
  Future<Either<MainFailure, CommentModel>> commentDislike(String data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.dislikecomment);
      var body = {"commentid": data};
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));

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
  Future<Either<MainFailure, CommentModel>> commentLike(String data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.likecomment);
      var body = {"commentid": data};
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));
        log(result.like.toString());

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
  Future<Either<MainFailure, bool>> deleteComment(String commentid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.deletecomment + commentid);

      final response = await http.delete(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  //subcomment section

  //addsub comment
  @override
  Future<Either<MainFailure, CommentModel>> postSubComment(
    Map<String, dynamic> data,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.subcommentpost);

      final response = await http.post(url,
          headers: <String, String>{
            // 'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
          body: data);
      log(jsonDecode(response.body).toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));

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
  Future<Either<MainFailure, CommentModel>> subCommentDislike(
      String commentid, int subcommentindex) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.dislikesubcomment);
      var body = {
        "commentid": commentid,
        "subcommentindex": "$subcommentindex"
      };
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));

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
  Future<Either<MainFailure, CommentModel>> subCommentLike(
      String commentid, int subcommentindex) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.likesubcomment);
      var body = {
        "commentid": commentid,
        "subcommentindex": "$subcommentindex"
      };

      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));
        log(result.subcomments![subcommentindex].like.toString());

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
  Future<Either<MainFailure, CommentModel>> deleteSuubComment(
      String commentid, int subcommentindex) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.deletesubcomment);
      var body = {
        "commentid": commentid,
        "subcommentindex": "$subcommentindex"
      };
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = CommentModel.fromJson(jsonDecode(response.body));

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
