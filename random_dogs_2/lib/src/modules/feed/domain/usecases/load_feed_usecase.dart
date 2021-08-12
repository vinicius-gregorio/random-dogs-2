import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/domain/errors/feed_errors.dart';
import 'package:random_dogs_2/src/modules/feed/domain/repositories/feed_repository.dart';

abstract class ILoadFeedUsecase {
  Future<Either<FeedError, DogResponse>> call(LoadFeedParams params);
}

class LoadFeedUsecase implements ILoadFeedUsecase {
  final FeedRepository repository;

  LoadFeedUsecase(this.repository);
  @override
  Future<Either<FeedError, DogResponse>> call(LoadFeedParams params) async {
    if (params.numberOfPhotos > 50) {
      return Left(FeedError(message: 'Maximum number of photos is 50'));
    }
    if (params.numberOfPhotos <= 0) {
      return Left(FeedError(message: 'Minimum number of photos is 1'));
    }

    return repository.getFeed(params);
  }
}

class LoadFeedParams {
  final numberOfPhotos;

  LoadFeedParams({required this.numberOfPhotos});
}

// main(List<String> args) async {
//   final feedUsecase = LoadFeedUsecase();
//   final result = await feedUsecase();

//   result.fold((l) {
//     print('error');
//   }, (r) {
//     print('setState');
//   });
// }
