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
    when(() => repository.getFeed(params)).thenAnswer(
        (_) async => DogResponse(photo: ['', '', '', '', ''], status: '200'));

    final result = await loadFeedUsecase(params);
    expect(result, isA<DogResponse>());
  });

  test('should check if works if the results is 200', () async {
    when(() => repository.getFeed(params)).thenAnswer(
        (_) async => DogResponse(photo: ['', '', '', '', ''], status: '200'));

    final result = await loadFeedUsecase(params);

    expect(result.status, '200');
  });

  test('should throw error if the number of photos is 0', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: 0);

    final result = loadFeedUsecase(errorParams);

    expect(() async => await result, throwsA(isA<FeedError>()));
  });
  test('should throw error if the number of photos is negative', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: -250);

    final result = loadFeedUsecase(errorParams);

    expect(() async => await result, throwsA(isA<FeedError>()));
  });
  test('should throw error if the number of photos more than 50', () async {
    final errorParams = LoadFeedParams(numberOfPhotos: 250);

    final result = loadFeedUsecase(errorParams);

    expect(() async => await result, throwsA(isA<FeedError>()));
  });
}
