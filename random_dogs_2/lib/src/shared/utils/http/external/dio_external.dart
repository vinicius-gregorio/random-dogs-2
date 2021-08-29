import 'package:dio/dio.dart';
import 'package:random_dogs_2/src/shared/http/repositories/http_client_repository.dart';

class DioRepository implements IHttpClientRepository {
  @override
  Future fetch(String url) async {
    final response = await Dio().get(url);
    return response.data;
  }

  @override
  void post() {}

  @override
  void put() {}
}
