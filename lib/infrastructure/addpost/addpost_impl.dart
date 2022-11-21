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
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<Either<MainFailure, Map>> uploadPostVideo(File file) async {
    try {
      Map data = {};

      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";

      final url = Uri.parse(ApiEndPoints.uploadpostfile);

      var request = http.MultipartRequest("POST", url);

      request.headers['x-auth-token'] = token;

      request.files.add(await http.MultipartFile.fromPath('myFile', file.path));

      await request.send().then((response) {
        http.Response.fromStream(response).then((onValue) {
          try {
            log(jsonDecode(onValue.body).toString());
            data = jsonDecode(onValue.body);
            return Right(jsonDecode(onValue.body));
          } catch (e) {
            log(e.toString());
            return const Left(MainFailure.serverFailure());
          }
        });
      });
      return Right(data);
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
