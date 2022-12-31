import 'dart:convert';
import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/core/api_end_points.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/post_services.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: PostService)
class PostImplementation implements PostService {
  @override
  Future<Either<MainFailure, PostModel>> dislikePost(
      String postid, int index) async {
    try {
      PostModel newModel = postListNotifier.value[index];

      newModel.dislike!.add(constusermodel.value.id);
      newModel.like!.contains(constusermodel.value.id)
          ? newModel.like!.remove(constusermodel.value.id)
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

      newModel.like!.add(constusermodel.value.id.toString());
      newModel.dislike!.contains(constusermodel.value.id)
          ? newModel.dislike!.remove(constusermodel.value.id)
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
  //report post

  @override
  Future<Either<MainFailure, PostModel>> reportPost(
      Map<String, dynamic> data, int index) async {
    try {
      PostModel newModel = postListNotifier.value[index];

      newModel.report!.add(data);

      postListNotifier.value = List.from(postListNotifier.value)
        ..replaceRange(index, index + 1, [newModel]);

      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse(ApiEndPoints.reportpost);

      final response = await http.post(url,
          headers: <String, String>{
            'x-auth-token': token,
            // 'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
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

//get continue
  @override
  Future<Either<MainFailure, PostsPageModel>> continuePost(
      String postid, int pageno) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("$kBaseurl/continue/$postid/$pageno/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = PostsPageModel.fromJson(jsonDecode(response.body));
        List<PostModel> list = result.results ?? [];
        log(list.length.toString());
        postListNotifier.value = List.from(postListNotifier.value)
          ..addAll(list);

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

  //post sharing option
  @override
  Future<String> postShare(String postid) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: "https://lobopunk.page.link/",
      link: Uri.parse("https://lobopunk.page.link/post/$postid"),

      androidParameters:
          const AndroidParameters(packageName: "com.appero.lobopunk"),
      // iosParameters: const IOSParameters(bundleId: "com.example.app.ios"),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    final shortDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.short,
    );
    final Uri link = shortDynamicLink.shortUrl;

    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getDynamicLink(link);
    final String postId = initialLink!.link.path.split('/post/')[1];
    log(dynamicLink.toString());
    log(dynamicLink.path.toString());
    log(link.path.toString());
    log(postid.toString());
    log(shortDynamicLink.shortUrl.toString());

    return link.toString();
  }

  //get posts by 1 hashtags
  @override
  Future<Either<MainFailure, PostsPageModel>> getPostbyhashtag(
      String hashtag) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("$kBaseurl/getpostbyonehashtag/$hashtag/0/");
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

  @override
  Future<Either<MainFailure, PostModel>> getPostid(String postid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      final url = Uri.parse("${ApiEndPoints.getsinglepost}$postid/");
      final response = await http.get(
        url,
        headers: <String, String>{
          'x-auth-token': token,
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
      );

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
