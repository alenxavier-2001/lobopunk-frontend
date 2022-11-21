import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart';
import 'package:lobopunk/presentation/addpost/addpost.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final res = await AddPostImplementation().addPostVideo();
                res.fold((l) {
                  log("Some error");
                }, (File file) {
                  log(file.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPostScreen(file: file)));
                });
              },
              child: const Text("Add post"))
        ],
      ),
    );
  }
}

class AddPostVideo {
  File file = File("");
  final ImagePicker picker = ImagePicker();

  Future<File> getVideo() async {
    final XFile? image = await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(minutes: 1));
    file = File(image!.path);

    if (image.path.isEmpty) getLostData();

    return file;
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      file = File(response.file!.path);
    } else {
      if (kDebugMode) {
        print(response.file);
      }
    }
  }
}
