import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

abstract class FilePickerServices {
  Future<Either<MainFailure, File>> addImage();
}
