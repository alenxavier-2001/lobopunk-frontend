import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/notification/notification_services.dart';
import 'package:lobopunk/domain/repost/repost_request_model/repost_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: NotificationServices)
class NotificationImplemnetation implements NotificationServices {
  @override
  Future<Either<MainFailure, RepostRequestModel>> approverecievedRequests(
      String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      Map<String, dynamic> body = {"reqstid": id};
      final url = Uri.parse(ApiEndPoints.acceptrepostrequest);
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = RepostRequestModel.fromJson(jsonDecode(response.body));

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
  Future<Either<MainFailure, bool>> deletesendedRequests(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      Map<String, dynamic> body = {"reqstid": id};
      final url = Uri.parse(ApiEndPoints.removerepostrequest);
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        //log(jsonDecode(response.body).toString());
        const result = true;

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
  Future<Either<MainFailure, bool>> rejectRequests(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      Map<String, dynamic> body = {"reqstid": id};
      final url = Uri.parse(ApiEndPoints.rejectrepostrequest);
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        //log(jsonDecode(response.body).toString());
        const result = true;

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
  Future<Either<MainFailure, List<RepostRequestModel>>>
      getrecievedRequests() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";

      final url = Uri.parse(ApiEndPoints.getrepostreceivedrequests);
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //log(jsonDecode(response.body).toString());
        final result = jsonDecode(response.body);
        final rqstlist = (result as List).map((e) {
          return RepostRequestModel.fromJson(e);
        }).toList();

        return Right(rqstlist);
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
  Future<Either<MainFailure, List<RepostRequestModel>>>
      getsendedRequests() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.getrepostsentrequests);
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = jsonDecode(response.body);
        final rqstlist = (result as List).map((e) {
          return RepostRequestModel.fromJson(e);
        }).toList();

        return Right(rqstlist);
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
