class ImagesModel {
  String? id;
  Map<String, dynamic>? urls;

  ImagesModel({this.id, this.urls});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urls = json['urls'];
  }
}
