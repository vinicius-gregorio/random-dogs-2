import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  List<String>? dogsPhotosList;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  Future<DogResponse?> getPhotos(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    return result.fold((l) => null, (r) => r);
  }

  void scrollToNext({required int index}) {
    itemScrollController.scrollTo(
        index: index + 1,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOutCubic);
  }

  void scrollToPrevious({required int index}) {
    itemScrollController.scrollTo(
        index: index - 1,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOutCubic);
  }
}
