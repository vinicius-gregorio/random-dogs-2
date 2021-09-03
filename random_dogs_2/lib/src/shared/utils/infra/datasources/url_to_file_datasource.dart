import 'package:random_dogs_2/src/shared/utils/domain/usecases/url_to_file_usecase.dart';

abstract class URLToFileDatasource {
  Future<String> saveImage(URLToFileParams params);
}
