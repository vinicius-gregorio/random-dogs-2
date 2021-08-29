import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';

abstract class URLToFileRepository {
  Future<Either<URLToFileError, File>> convertFile(URLToFileParams params);
}
