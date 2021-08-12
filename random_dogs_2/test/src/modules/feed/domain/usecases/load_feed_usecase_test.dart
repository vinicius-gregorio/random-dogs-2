import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/errors/feed_errors.dart';
import 'package:random_dogs_2/src/modules/feed/domain/repositories/feed_repository.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';

class FeedRepositoryMock extends Mock implements FeedRepository {}

void main() {
  final repository = FeedRepositoryMock();
  final loadFeedUsecase = LoadFeedUsecase(repository);
  final params = LoadFeedParams(numberOfPhotos: 5);
  test('should check if the result is a DogResponse', () async {
    when(() => repository.getFeed(params)).thenAnswer((_) async =>
        Right(DogResponse(photo: ['', '', '', '', ''], status: '200')));

    final result = await loadFeedUsecase(params);
    expect(result.isRight(), true);
  });

  test('should check if works if the results is 200', () async {
    when(() => repository.getFeed(params)).thenAnswer((_) async =>
        Right(DogResponse(photo: ['', '', '', '', ''], status: '200')));

    final result = await loadFeedUsecase(params);
    expect(result.isRight(), true);
  });

  test('should throw error if the number of photos is 0', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: 0);

    final result = await loadFeedUsecase(errorParams);

    expect(result.isLeft(), true);
  });
  test('should throw error if the number of photos is negative', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: -250);

    final result = await loadFeedUsecase(errorParams);

    expect(result.isLeft(), true);
  });
  test('should throw error if the number of photos more than 50', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: 250);

    final result = await loadFeedUsecase(errorParams);

    expect(result.isLeft(), true);
  });

  test('should throw error if repository fails', () async {
    when(() => repository.getFeed(params))
        .thenAnswer((invocation) async => Left(FeedError(message: '')));

    final result = await loadFeedUsecase(params);
    expect(result.isLeft(), true);
  });
}
