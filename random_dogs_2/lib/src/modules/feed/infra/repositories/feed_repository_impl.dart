import 'package:random_dogs_2/src/modules/feed/domain/errors/feed_errors.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:dartz/dartz.dart';
import 'package:random_dogs_2/src/modules/feed/domain/repositories/feed_repository.dart';
import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/infra/datasources/feed_datasource.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDatasource feedDataSource;

  FeedRepositoryImpl(this.feedDataSource);

  @override
  Future<Either<FeedError, DogResponse>> getFeed(LoadFeedParams params) async {
    try {
      final feed = await feedDataSource.getFeed(params);
      print('got the feed');
      return Right(feed);
    } on FeedError catch (e) {
      return Left(e);
    } on Exception {
      return Left(FeedError(message: 'Repository Error'));
    }
  }
}
