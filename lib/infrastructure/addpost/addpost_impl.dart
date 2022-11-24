import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/addpost/addpost_services.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:http/http.dart' as http;
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_compress/video_compress.dart';

@LazySingleton(as: AddPostService)
class AddPostImplementation extends AddPostService {
  File file = File("");
  final ImagePicker picker = ImagePicker();

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      file = File(response.file!.path);
    } else {
      print(response.file);
    }
  }

  @override
  Future<Either<MainFailure, File>> addPostVideo() async {
    try {
      final XFile? image = await picker.pickVideo(
          source: ImageSource.gallery, maxDuration: const Duration(minutes: 1));
      file = File(image!.path);

      if (image.path.isEmpty) getLostData();
      return Right(file);
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, File>> getVideoThumbnail(File file) async {
    try {
      final thumbnailFile = await VideoCompress.getFileThumbnail(file.path,
          quality: 50, // default(100)
          position: -1 // default(-1)
          );

      return Right(thumbnailFile);
    } catch (e) {
      //
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Map<String, dynamic>> uploadPostVideo(File file) async {
    try {
      Map<String, dynamic> data = {};

      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";

      final url = Uri.parse(ApiEndPoints.uploadpostfile);

      var request = http.MultipartRequest("POST", url);

      request.headers['x-auth-token'] = token;
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';

      request.files.add(await http.MultipartFile.fromPath('myFile', file.path));

      await request.send().then((response) async {
        await http.Response.fromStream(response).then((onValue) {
          data = jsonDecode(onValue.body);
          return data;
        });
      });
      log(data.toString());

      return data;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  @override
  Future<Either<MainFailure, PostModel>> uploadPostData(Map data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.uploadpostdata);
      log(data.toString());
      final body = jsonEncode(data);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
          body: body);
      log(jsonDecode(response.body).toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = PostModel.fromJson(jsonDecode(response.body));
        print(jsonDecode(response.body));
        return Right(result);
      } else {
        print("object");
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
