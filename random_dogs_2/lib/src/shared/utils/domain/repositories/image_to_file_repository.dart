import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/convert_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/image_to_file_usecase.dart';

abstract class ImageToFileRepository {
  Either<ConvertError, File> convertImageUrlToFile(
      ConvertImageToUrlParams params);
}
