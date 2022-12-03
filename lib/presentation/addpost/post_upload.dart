import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart';
import 'package:lobopunk/infrastructure/addpost/video_compress.dart';
import 'package:lobopunk/presentation/addpost/widgets/videocompressprogressbar.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/presentation/main_page/bottom_nav.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:video_compress/video_compress.dart';
import 'package:path/path.dart' as path;

String imgurl =
    "https://pictures.dealer.com/l/landrover/0916/a17f71943b6c3065240bf55ae393110dx.jpg?impolicy=resize&w=750";

String imgurl2 =
    "https://cdn.motor1.com/images/mgl/qNALJ/s3/nissan-gt-r50-by-italdesign.jpg";

class PostUploadScreen extends StatefulWidget {
  final File file;
  final Map data;
  const PostUploadScreen({super.key, required this.data, required this.file});

  @override
  State<PostUploadScreen> createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  File orginalvideo = File('');

  File thumbnail = File('');
  File highvid = File('');
  File midvid = File('');

  String thumbnaillink = "";
  String lowvidlink = "";
  String midvidlink = "";
  String highvidlink = "";

  bool iscompressing = false;

  File lowvid = File('');
  MediaInfo info = MediaInfo(path: '');

  String compressingtext = "Please wait, it will complete within minutes";

  @override
  void initState() {
    orginalvideo = widget.file;
    getVideoThumbnail();

    super.initState();
  }

  double getFileSize(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  getVideoThumbnail() async {
    final thumbnailFile =
        await AddPostImplementation().getVideoThumbnail(orginalvideo);
    final inf = await VideoCompress.getMediaInfo(orginalvideo.path);
    thumbnailFile.fold((MainFailure failure) {
      navIndexChangeNotifier.value = 0;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPageScreen()));
    }, (File resfile) {
      setState(() {
        thumbnail = File(changeFileName(resfile, 'thumbnail.jpg'));
        info = inf;
      });
    });

    await AddPostImplementation().uploadPostVideo(thumbnail).then((value) {
      thumbnaillink = value['filepath'];
    });

    //lowvid = File(changeFileName(orginalvideo, "lowvid.mp4"));

    lowVideoCompression(orginalvideo);
    // sheduleprocess();
  }

  // sheduleprocess() {
  //   if (info.height! > 480 && info.width! > 640 ||
  //       info.height! > 640 && info.width! > 480) {
  //     lowVideoCompression(orginalvideo);
  //     print("compress low");
  //     if ((info.height! > 540 && info.width! > 960) ||
  //         (info.height! > 960 && info.width! > 540)) {
  //       print("compress mid");
  //       if ((info.height! > 720 && info.width! > 1280) ||
  //           ((info.height! > 1280 && info.width! > 720))) {
  //         print("compress high");
  //       } else {
  //         print("no high quality compress");
  //       }
  //     } else {
  //       print("no mid quality compress");
  //     }
  //   } else {
  //     print("no low quality compress");
  //   }
  // }

  String changeFileName(File namefile, String name) {
    File temp = namefile;
    String dir = path.dirname(temp.path);
    String newPath = path.join(dir, name);

    temp.renameSync(newPath);

    return newPath;
  }

  lowVideoCompression(File path) async {
    if (info.height! > 480 && info.width! > 640 ||
        info.height! > 640 && info.width! > 480) {
      // showDialog(
      // context: context,
      // barrierDismissible: false,
      // builder: ((context) => const Dialog(
      //       child: CompressProgress(),
      //     )));
      setState(() {
        iscompressing = true;
      });
      await VideoCompressApi.compressVideo(path, VideoQuality.Res640x480Quality)
          .then((value) {
        setState(() {
          iscompressing = false;
        });

        lowvid = File(changeFileName(value!.file!, "lowvid.mp4"));
      });
      await AddPostImplementation().uploadPostVideo(lowvid).then((value) async {
        log(value.toString());
        lowvidlink = await value['filepath'];
        midvidlink = lowvidlink;
        highvidlink = lowvidlink;
      }).whenComplete(() {
        print("gooooooooooo");
        midVideoCompression(orginalvideo);
      });
    } else {
      var lastIndex = orginalvideo.path.lastIndexOf("/");
      String newpath = orginalvideo.path.substring(0, lastIndex);

      final newFile = await orginalvideo.copy('$newpath/lowvid.mp4');
      lowvid = newFile;
      await AddPostImplementation().uploadPostVideo(lowvid).then((value) {
        lowvidlink = value['filepath'];

        midvidlink = lowvidlink;
        highvidlink = lowvidlink;
      }).whenComplete(() {
        uploadingSection();
      });
    }
  }

  midVideoCompression(File path) async {
    if ((info.height! > 540 && info.width! > 960) ||
        (info.height! > 960 && info.width! > 540)) {
      print("compress mid");
      setState(() {
        compressingtext = "I apologise, please wait once again";
        iscompressing = true;
      });
      await VideoCompressApi.compressVideo(path, VideoQuality.Res960x540Quality)
          .then((value) {
        setState(() {
          iscompressing = false;
        });
        midvid = File(changeFileName(value!.file!, "midvid.mp4"));
      });

      await AddPostImplementation().uploadPostVideo(midvid).then((value) async {
        midvidlink = await value['filepath'];

        highvidlink = midvidlink;
      }).whenComplete(() {
        highVideoCompression(orginalvideo);
      });
    } else {
      print("no mid quality compress");
      uploadingSection();
    }
  }

  highVideoCompression(File path) async {
    if ((info.height! > 720 && info.width! > 1280) ||
        ((info.height! > 1280 && info.width! > 720))) {
      print("compress high");
      setState(() {
        compressingtext = "It's last, promise";
        iscompressing = true;
      });

      await VideoCompressApi.compressVideo(
              path, VideoQuality.Res1280x720Quality)
          .then((value) {
        setState(() {
          iscompressing = false;
        });
        highvid = File(changeFileName(value!.file!, "highvid.mp4"));
      });

      await AddPostImplementation().uploadPostVideo(midvid).then((value) {
        highvidlink = value['filepath'];
      }).whenComplete(() => uploadingSection());
    } else {
      print("no high quality compress");
      uploadingSection();
    }
  }

  uploadingSection() async {
    try {
      if (thumbnaillink != "" && lowvidlink != "") {
        if (midvidlink == "" && highvidlink == "") {
          midvidlink = lowvidlink;
          highvidlink = lowvidlink;
        }
        if (midvidlink == "") {
          midvidlink = lowvidlink;
        }
        if (highvidlink == "") {
          highvidlink = midvidlink;
        }
        DateTime time = DateTime.now().toUtc();

        Map data = {
          "highvideourl": highvidlink,
          "midvideourl": midvidlink,
          "lowvideourl": lowvidlink,
          "thumbnailurl": thumbnaillink,
          "posttime": time.toString(),
          "description": widget.data["description"],
          "hashtags": widget.data["hashtags"],
        };
        final res = await AddPostImplementation().uploadPostData(data);
        res.fold((l) {
          log(1.toString());
        }, (PostModel resp) {
          navIndexChangeNotifier.value = 0;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPageScreen()));
          // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        });
      } else {}
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 30),
          child: Column(
            children: [
              SizedBox(
                height: height / 2.2,
                child: Image.network(
                  imgurl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width / 40),
                child: Text(
                  (iscompressing) ? compressingtext : "Uploading dont close",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: width / 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width / 30),
                child: const CompressProgress(),
              ),
              SizedBox(
                height: height / 2.2,
                child: Image.network(
                  imgurl2,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
