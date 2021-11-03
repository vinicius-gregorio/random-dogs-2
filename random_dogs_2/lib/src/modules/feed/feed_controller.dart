import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';
import 'package:random_dogs_2/src/shared/utils/external/image_downloader_datasource.dart';
import 'package:random_dogs_2/src/shared/utils/infra/repositories/url_to_file_repository_impl.dart';
import 'package:random_dogs_2/src/shared/utils/storage/domain/controllers/storage_controller.dart';
import 'package:random_dogs_2/src/shared/utils/storage/external/hive_repository.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/services.dart';
import 'domain/usecases/load_feed_usecase.dart';
import 'external/dogs_api/dogs_api_impl.dart';
import 'infra/repositories/feed_repository_impl.dart';

class FeedController {
  final loadfeedUsecase = LoadFeedUsecase(FeedRepositoryImpl(DogsApiImpl()));

  final urlToFileUsecase = URLToFileUsecase(
      params: URLToFileParams(''),
      repository: URLToFileRepositoryImpl(dataSource: ImageDownloaderImpl()));

  List<String> dogsPhotosList = [];
  final snackBarFavorited = SnackBar(
    content: const Text('Favorited'),
  );
  final snackBarError = SnackBar(
    content: const Text('Error'),
  );
  final snackBarClipboard = SnackBar(
    content: const Text('Coppied To Clipboard'),
  );
  final snackBarUnfavorited = SnackBar(
    content: const Text('Unfavorited'),
  );

  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  int dogsListIndex = 0;

  void saveImage(String url, BuildContext context) async {
    try {
      StorageController(HiveRepository()).repository.save(url);
      ScaffoldMessenger.of(context).showSnackBar(snackBarFavorited);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
    }
  }

  Future<void> copyImageToClipboard(
      ClipboardData data, BuildContext context) async {
    try {
      await SystemChannels.platform.invokeMethod<void>(
        'Clipboard.setData',
        <String, dynamic>{
          'text': data.text,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBarClipboard);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarError);
    }
  }

  //LIST BEHAVIOUR

  Future<DogResponse?> getPhotos(LoadFeedParams params) async {
    final result = await loadfeedUsecase.repository.getFeed(params);
    if (dogsPhotosList.length < 1) {
      dogsPhotosList = result.fold((l) => [], (r) => r.photo!);
    }
    return result.fold((l) => null, (r) => r);
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
