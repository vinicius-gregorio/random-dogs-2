import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/ui/components/pop_menu_component.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';
import 'package:random_dogs_2/src/shared/utils/external/image_downloader_datasource.dart';
import 'package:random_dogs_2/src/shared/utils/infra/repositories/url_to_file_repository_impl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));
  final urlToFileUsecase = URLToFileUsecase(
      params: URLToFileParams(''),
      repository: URLToFileRepositoryImpl(dataSource: ImageDownloaderImpl()));
  List<String> dogsPhotosList = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  int dogsListIndex = 0;

  Future<DogResponse?> getPhotos(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    if (dogsPhotosList.length < 1) {
      dogsPhotosList = result.fold((l) => [], (r) => r.photo!);
    }
    return result.fold((l) => null, (r) => r);
  }

  void saveImage(String url) async {
    urlToFileUsecase.call(URLToFileParams(url));
  }

  void updateDogsImages(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    var newDogsPhotosList = result.fold((l) => null, (r) => r.photo);
    dogsListIndex = dogsPhotosList.length - 3;
    newDogsPhotosList?.forEach((photo) {
      dogsPhotosList.add(photo);
    });
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

  void scrollTo({required int index}) {
    itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOutCubic);
  }
}
