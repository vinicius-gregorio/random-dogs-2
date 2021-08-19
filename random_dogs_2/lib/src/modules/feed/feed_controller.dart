import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';

import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  List<String>? dogsPhotosList;

  Future<DogResponse?> getPhotos(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    return result.fold((l) => null, (r) => r);
  }

  // void scrollToNextIndex(ScrollController scrollController, double index) {
  //   scrollController.animateTo(index,
  //       duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  // }
}
