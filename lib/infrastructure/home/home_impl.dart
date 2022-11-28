


/*import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/home/home_services.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:http/http.dart' as http;
@LazySingleton(as: HomeServices)
class HomeImplementation implements HomeServices{
  @override
  Future<Either<MainFailure, PostModel>> getSubscribedPosts() async{


    try {
      final url = Uri.parse("${ApiEndPoints.getsubscribedposts}0/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        const result = true;
        return const Right(result);
      
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
   
  }

}*/