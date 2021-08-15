import 'package:flutter_test/flutter_test.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/external/dogs_api/dogs_api_impl.dart';
import 'package:random_dogs_2/src/modules/feed/infra/repositories/feed_repository_impl.dart';

void main() {
  //integration tests
  test('should return dogs', () async {
    final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));

    var response = await loadfeedUsecase.repository
        .getFeed(LoadFeedParams(numberOfPhotos: 5));

    expect(response.isRight(), true);
  });
}
