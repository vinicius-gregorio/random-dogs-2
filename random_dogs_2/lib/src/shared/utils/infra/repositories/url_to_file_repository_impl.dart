import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/shared/utils/domain/repositories/url_to_file_repository.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';
import 'package:random_dogs_2/src/shared/utils/infra/datasources/url_to_file_datasource.dart';

class URLToFileRepositoryImpl implements URLToFileRepository {
  final URLToFileDatasource dataSource;

  URLToFileRepositoryImpl({required this.dataSource});
  @override
  Future<Either<URLToFileError, String>> convertFile(
      URLToFileParams params) async {
    try {
      final image = await dataSource.saveImage(params);

      return Right(image);
    } on URLToFileError catch (e) {
      return Left(e);
    } on Exception {
      return Left(URLToFileError(message: 'Repository Implementation Error'));
    }
  }
}
