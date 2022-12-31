import 'dart:convert';
import 'dart:developer';

import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/usernamenotifer.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
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

  @override
  Future<Either<MainFailure, PostsPageModel>> getMyPosts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.getuserposts);
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
      } else if (response.statusCode == 300) {
        final result = PostsPageModel(page: 0, results: []);

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
  Future<Either<MainFailure, Map<String, dynamic>>> getUserName(
      {required String userid}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("${ApiEndPoints.getusername}$userid");

      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        Map<String, dynamic> dat = {userid: result['userid']};
        Map<String, dynamic> image = {userid: result['profileimage']};
        // usernamlists.value.addAll({userid: result['userid']});
        // usernamlists.value[userid] = result['userid'];
        //usernamlists.notifyListeners();
        usernamlists.value = Map.from(usernamlists.value)..addAll(dat);
        userimagelists.value = Map.from(userimagelists.value)..addAll(image);
        return Right(dat);
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
  Future<Either<MainFailure, PostModel>> editPost(
      Map<String, dynamic> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.edituserposts);
      var body = data;
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
  Future<Either<MainFailure, UserModel>> punkUser(String userid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.punkUsers);
      Map<String, dynamic> body = {"channelid": userid};
      UserModel user = constusermodel.value;
      List punklist = user.punking ?? [];
      punklist = List.from(punklist)..addAll([userid]);
      user.punking = punklist;

      constusermodel.value = UserModel();
      constusermodel.value = user;

      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = UserModel.fromJson(jsonDecode(response.body));
        constusermodel.value = result;

        return Right(result);
      } else {
        constusermodel.value.punking!.remove(userid);
        return Left(MainFailure.serverFailure(
            ServerErrorModel.fromJson(jsonDecode(response.body))));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure(e.toString()));
    }
  }
}
