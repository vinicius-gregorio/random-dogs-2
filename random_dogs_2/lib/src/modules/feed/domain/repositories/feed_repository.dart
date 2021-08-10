import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';

abstract class FeedRepository {
  Future<DogResponse> getFeed();
}
