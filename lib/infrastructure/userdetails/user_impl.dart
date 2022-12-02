import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:lobopunk/domain/user/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: UserServices)
class UserImplementation extends UserServices {
  @override
  Future<Either<MainFailure, UserModel>> uploadProfilePic(
      {required File file}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";

      final url = Uri.parse(ApiEndPoints.updateuserprofileimage);

      var request = http.MultipartRequest("POST", url);

      request.headers['x-auth-token'] = token;
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';

      request.files.add(await http.MultipartFile.fromPath('myFile', file.path));

      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = {"path": ""};
        await http.Response.fromStream(response).then((onValue) {
          data = jsonDecode(onValue.body);

          return Right(UserModel.fromJson(jsonDecode(onValue.body)));
        });

        return Right(UserModel.fromJson(data));
      } else {
        return Left(MainFailure.serverFailure(
            ServerErrorModel(msg: "Some Error in upload")));
      }
      // .then((response) async {
      //   if (response.statusCode == 200 || response.statusCode == 201) {
      //     await http.Response.fromStream(response).then((onValue) {
      //       data = jsonDecode(onValue.body);
      //       return Right(UserModel.fromJson(data));
      //     });
      //   } else {
      //     return const Left(MainFailure.serverFailure());
      //   }
      // });
      // log(data.toString());

      // return Right(UserModel.fromJson(data));
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> getUseData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.getuserdata);
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(jsonDecode(response.body));
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
  Future<Either<MainFailure, UserModel>> editProfile(
      {required Map<String, dynamic> data}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.updateuserdata);
      var body = data;
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(jsonDecode(response.body));
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
  Future<Either<MainFailure, UserModel>> editSocialLink(
      {required Map<String, dynamic> data}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.updateusersociallink);
      var body = data;
      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(jsonDecode(response.body));
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
