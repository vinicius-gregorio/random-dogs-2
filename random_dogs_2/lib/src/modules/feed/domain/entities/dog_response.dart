class DogResponse {
  List<String>? photo;
  String? status;

  DogResponse({required this.photo, required this.status});

  DogResponse.fromJson(Map<String, dynamic> json) {
    photo = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.photo;
    data['status'] = this.status;
    return data;
  }
}
