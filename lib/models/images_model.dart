class ImagesModel {
  String? id;
  String? description;
  String? thumb;
  String? raw;

  ImagesModel({this.id, this.description, this.thumb, this.raw});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    thumb = json['thumb'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['thumb'] = thumb;
    data['raw'] = raw;
    return data;
  }
}
