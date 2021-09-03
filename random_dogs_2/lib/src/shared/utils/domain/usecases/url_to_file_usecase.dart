import 'package:dartz/dartz.dart';
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
  Future<Either<URLToFileError, String>> call(URLToFileParams params);
}

class URLToFileUsecase implements IURLToFileUsecase {
  final httpController = HttpClientController(DioRepository());
  final URLToFileRepository repository;
  final URLToFileParams params;

  URLToFileUsecase({required this.params, required this.repository});
  @override
  Future<Either<URLToFileError, String>> call(params) async {
    if (!isURL(params.url)) {
      return Left(URLToFileError(message: 'The provided image is not an URL'));
    }
    print(params.url);
    return repository.convertFile(params);
  }
}
