import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/repositories/url_to_file_repository.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';

class URLToFileRepositoryMock extends Mock implements URLToFileRepository {}

Future<void> main() async {
  final repository = URLToFileRepositoryMock();
  final urlToFileUsecase =
      URLToFileUsecase(params: URLToFileParams(''), repository: repository);
  final params = URLToFileParams('');
  test('Should return error if invalid URL', () async {
    when(() => repository.convertFile(params))
        .thenAnswer((_) async => Left(URLToFileError(message: 'Error')));

    final result = await urlToFileUsecase(params);
    expect(result.isLeft(), true);
  });
}
