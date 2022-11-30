import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/filepicker_service/file_picker_services.dart';

@LazySingleton(as: FilePickerServices)
class FilePickerImplementation extends FilePickerServices {
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
  Future<Either<MainFailure, File>> addImage() async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );
      file = File(image!.path);

      if (image.path.isEmpty) getLostData();
      return Right(file);
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
