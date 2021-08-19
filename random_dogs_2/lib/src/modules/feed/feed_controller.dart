import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';

import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  Future<DogResponse?> getPhotos(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    return result.fold((l) => null, (r) => r);
  }
}



// class FeedController {
//   final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
//   Future<List<String>?> getPhotos(LoadFeedParams params) async {
//     final result = await loadfeedUsecase.repository.getFeed(params);
//     return result.fold((l) => null, (r) => r.photo);
//   }
// }
