class ImagesModel {
  String? id;
  String? description;
  String? thumb;
  String? regular;
  String? raw;

  ImagesModel({this.id, this.description, this.thumb, this.regular, this.raw});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    thumb = json['thumb'];
    regular = json['regular'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['description'] = description;
    data['thumb'] = thumb;
    data['regular'] = regular;
    data['raw'] = raw;
    return data;
  }
}
