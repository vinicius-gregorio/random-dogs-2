import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:random_dogs_2/src/shared/utils/domain/errors/url_to_file_errors.dart';
import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';
import 'package:random_dogs_2/src/shared/utils/infra/datasources/url_to_file_datasource.dart';

class ImageDownloaderImpl implements URLToFileDatasource {
  @override
  Future<String> saveImage(URLToFileParams params) async {
    String? imageId = '';
    try {
      imageId = await ImageDownloader.downloadImage(params.url);
      if (imageId == null) {
        return '';
      }
      var fileName = await ImageDownloader.findName(imageId);
      if (fileName != null) {
        return fileName;
      }
    } on PlatformException catch (e) {
      return e.toString();
    } on URLToFileError catch (f) {
      return f.toString();
    }
    return imageId.length > 1 ? imageId : '';
  }
}
