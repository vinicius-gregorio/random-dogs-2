import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/errors/feed_errors.dart';
import 'package:random_dogs_2/src/modules/feed/domain/repositories/feed_repository.dart';

abstract class ILoadFeedUsecase {
  call(LoadFeedParams params);
}

class LoadFeedUsecase implements ILoadFeedUsecase {
  final FeedRepository repository;

  LoadFeedUsecase(this.repository);
  @override
  Future<DogResponse> call(LoadFeedParams params) {
    if (params.numberOfPhotos > 50) {
      throw FeedErrors(message: 'Max number of photos is 50');
    }
    if (params.numberOfPhotos <= 0) {
      throw FeedErrors(message: 'Min number of photos is 1');
    }
    return repository.getFeed();
  }
}

class LoadFeedParams {
  final numberOfPhotos;

  LoadFeedParams({required this.numberOfPhotos});
}
