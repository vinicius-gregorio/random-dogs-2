import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/repositories/url_to_file_repository.dart';
import 'package:string_validator/string_validator.dart';

class URLToFileParams {
  final String url;

  URLToFileParams(this.url);
}

abstract class IURLToFile {
  Future<Either<URLToFileError, File>> call(URLToFileParams params);
}

class URLToFileUsecase implements IURLToFile {
  final URLToFileRepository repository;

  URLToFileUsecase(this.repository);
  @override
  Future<Either<URLToFileError, File>> call(URLToFileParams params) async {
    if (!isURL(params.url)) {
      return Left(URLToFileError(message: 'The provided image is not an URL'));
    }
    return repository.convertFile(params);
  }
}
