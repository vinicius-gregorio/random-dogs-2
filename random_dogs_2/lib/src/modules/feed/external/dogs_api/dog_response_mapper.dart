import 'package:random_dogs_2/src/modules/feed/domain/entities/dog_response.dart';

class DogResponseMapper {
  static DogResponse fromJson(Map json) {
    return DogResponse(
        photo: List<String>.from(json['message']), status: json['status']);
  }

  static DogResponse fromMap(Map<String, dynamic> map) {
    return DogResponse(
      photo: List<String>.from(map['message']),
      status: map['status'],
    );
  }
}
