import 'package:random_dogs_2/src/modules/feed/domain/usecases/load_feed_usecase.dart';
import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';
import 'package:random_dogs_2/src/modules/feed/external/dogs_api/dog_response_mapper.dart';
import 'package:random_dogs_2/src/modules/feed/infra/datasources/feed_datasource.dart';
import 'package:random_dogs_2/src/shared/constants/apis_constants.dart';
import 'package:random_dogs_2/src/shared/http/controllers/http_client_controller.dart';
import 'package:random_dogs_2/src/shared/http/external/dio_external.dart';

class DogsApiImpl implements FeedDatasource {
  @override
  Future<DogResponse> getFeed(LoadFeedParams params) async {
    final httpController = HttpClientController(DioRepository());
    // var response = DogResponse(photo: ['photo 1', 'photo 2'], status: '200');

    var response = await httpController.repository
        .fetch('$dogBaseUrl/breeds/image/random/${params.numberOfPhotos}');
    var mapped = DogResponseMapper.fromJson(response);
    print(mapped.photo);
    return mapped;
  }
}
