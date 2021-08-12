import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';

abstract class FeedRepository {
  Future<DogResponse> getFeed(LoadFeedParams params);
}
