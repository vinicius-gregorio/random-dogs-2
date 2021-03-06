import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/errors/feed_errors.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';

abstract class FeedRepository {
  Future<Either<FeedError, DogResponse>> getFeed(LoadFeedParams params);
}
