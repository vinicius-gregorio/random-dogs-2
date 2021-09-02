import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/repositories/url_to_file_repository.dart';
import 'package:random_dogs_2/src/shared/utils/http/controllers/http_client_controller.dart';
import 'package:random_dogs_2/src/shared/utils/http/external/dio_external.dart';
import 'package:string_validator/string_validator.dart';

class URLToFileParams {
  final String url;

  URLToFileParams(this.url);
}

abstract class IURLToFileUsecase {
  Future<Either<URLToFileError, File>> call(URLToFileParams params);
}

class URLToFileUsecase implements IURLToFileUsecase {
  final httpController = HttpClientController(DioRepository());
  final URLToFileParams params;

  URLToFileUsecase(this.params);
  @override
  Future<Either<URLToFileError, File>> call(params) async {
    if (!isURL(params.url)) {
      return Left(URLToFileError(message: 'The provided image is not an URL'));
    }
    try {
      var rng = new Random();
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file =
          new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
      final response = await httpController.repository.fetch(params.url);
      return Right(await file.writeAsBytes(response.bodyBytes));
    } catch (e) {
      return Left(URLToFileError(message: 'Error: ${e.toString()}'));
    }
  }
}
