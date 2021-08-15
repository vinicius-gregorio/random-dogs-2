import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  void getPhotos(LoadFeedParams params) async {
    loadfeedUsecase.repository.getFeed(params);
  }
}
