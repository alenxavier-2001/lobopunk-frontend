import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart';
import 'package:lobopunk/infrastructure/addpost/video_compress.dart';
import 'package:lobopunk/presentation/addpost/widgets/videocompressprogressbar.dart';
import 'package:video_compress/video_compress.dart';
import 'package:path/path.dart' as path;

class PostUploadScreen extends StatefulWidget {
  final File file;
  final Map data;
  const PostUploadScreen({super.key, required this.data, required this.file});

  @override
  State<PostUploadScreen> createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  File orginalvideo = File('');
  double size = 0;
  File thumbnail = File('');
  File highvid = File('');
  File midvid = File('');

  bool ishighvid = false;
  bool ismidvid = false;
  bool islowvid = false;

  File lowvid = File('');
  MediaInfo info = MediaInfo(path: '');
  MediaInfo? lowcompressVideoInfo;
  MediaInfo? midcompressVideoInfo;
  MediaInfo? highcompressVideoInfo;

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
        await VideoCompress.getFileThumbnail(orginalvideo.path,
            quality: 50, // default(100)
            position: -1 // default(-1)
            );
    final inf = await VideoCompress.getMediaInfo(orginalvideo.path);

    setState(() {
      thumbnail = File(changeFileName(thumbnailFile, 'thumbnail.jpg'));
      info = inf;
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
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => const Dialog(
                child: CompressProgress(),
              )));

      final infoo = await VideoCompressApi.compressVideo(
              path, VideoQuality.Res640x480Quality)
          .whenComplete(() {
        midVideoCompression(orginalvideo);
      });
      setState(() {
        islowvid = true;
        lowcompressVideoInfo = infoo;
        lowvid = File(changeFileName(lowcompressVideoInfo!.file!, 'lowvid'));
        Navigator.pop(context);
      });
    } else {
      print("no low quality compress");
    }
    log(lowvid.path.toString());
  }

  midVideoCompression(File path) async {
    if ((info.height! > 540 && info.width! > 960) ||
        (info.height! > 960 && info.width! > 540)) {
      print("compress mid");
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => const Dialog(
                child: CompressProgress(),
              )));

      final infoo = await VideoCompressApi.compressVideo(
              path, VideoQuality.Res960x540Quality)
          .whenComplete(() {
        highVideoCompression(orginalvideo);
      });
      setState(() {
        ismidvid = true;
        midcompressVideoInfo = infoo;
        midvid = File(changeFileName(midcompressVideoInfo!.file!, 'midvid'));
        Navigator.pop(context);
      });
    } else {
      print("no mid quality compress");
    }
    log(midvid.path.toString());
  }

  highVideoCompression(File path) async {
    if ((info.height! > 720 && info.width! > 1280) ||
        ((info.height! > 1280 && info.width! > 720))) {
      print("compress high");
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => const Dialog(
                child: CompressProgress(),
              )));

      final infoo = await VideoCompressApi.compressVideo(
          path, VideoQuality.Res1280x720Quality);
      setState(() {
        ishighvid = true;
        highcompressVideoInfo = infoo;
        highvid = File(changeFileName(highcompressVideoInfo!.file!, "highvid"));
        Navigator.pop(context);
      });
    } else {
      print("no high quality compress");
    }
    log(highvid.path.toString());
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
              Text(orginalvideo.path),
              Text(getFileSize(orginalvideo).toString()),
              Text(thumbnail.path),
              (thumbnail.path.isNotEmpty)
                  ? Image.file(
                      thumbnail,
                      height: height / 3,
                    )
                  : Container(),
              Text(info.height.toString()),
              Text(info.width.toString()),
              ElevatedButton(
                  onPressed: () {
                    // lowVideoCompression(orginalvideo);
                    AddPostImplementation().uploadPostVideo(orginalvideo);
                  },
                  child: Text("compress")),
              Text(orginalvideo.path),
              Text(lowvid.path),
              // Text((lowcompressVideoInfo != null)
              //     ? lowcompressVideoInfo!.height.toString()
              //     : ""),
              // Text((lowcompressVideoInfo != null)
              //     ? lowcompressVideoInfo!.width.toString()
              //     : ""),
              // Text((lowcompressVideoInfo != null)
              //     ? getFileSize(File(lowcompressVideoInfo!.file!.path))
              //         .toString()
              //     : ""),
              // Text((midcompressVideoInfo != null)
              //     ? midcompressVideoInfo!.height.toString()
              //     : ""),
              // Text((midcompressVideoInfo != null)
              //     ? midcompressVideoInfo!.width.toString()
              //     : ""),
              // Text((midcompressVideoInfo != null)
              //     ? getFileSize(File(midcompressVideoInfo!.file!.path))
              //         .toString()
              //     : ""),
              // Text((highcompressVideoInfo != null)
              //     ? highcompressVideoInfo!.height.toString()
              //     : ""),
              // Text((highcompressVideoInfo != null)
              //     ? highcompressVideoInfo!.width.toString()
              //     : ""),
              // Text((highcompressVideoInfo != null)
              //     ? getFileSize(File(highcompressVideoInfo!.file!.path))
              //         .toString()
              //     : ""),
              Text("high compressed : $ishighvid"),
              Text("mid compressed : $ismidvid"),
              Text("low compressed : $islowvid"),
              (lowvid.path == "")
                  ? Container()
                  : Text(getFileSize(lowvid).toString()),
              (midvid.path == "")
                  ? Container()
                  : Text(getFileSize(midvid).toString()),
              (highvid.path == "")
                  ? Container()
                  : Text(getFileSize(highvid).toString()),
            ],
          ),
        ),
      ),
    );
  }
}
