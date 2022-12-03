import 'dart:io';

import 'package:video_compress/video_compress.dart';

class VideoCompressApi {
  static Future<MediaInfo?> compressVideo(
      File file, VideoQuality quality) async {
    try {
      await VideoCompress.setLogLevel(0);

      return VideoCompress.compressVideo(file.path,
          quality: quality, includeAudio: true);
    } catch (e) {
      VideoCompress.cancelCompression();
    }
    return null;
  }
}
