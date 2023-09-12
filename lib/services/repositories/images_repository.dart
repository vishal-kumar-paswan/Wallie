import 'package:dio/dio.dart';
import 'package:wallie/models/images_model.dart';
import 'package:wallie/services/apis/images_api.dart';

class ImagesRepository {
  static final ImagesAPI _api = ImagesAPI();

  Future<List<ImagesModel>> fetchImages() async {
    try {
      Response response = await _api.sendRequest.get("/photos?per_page=30");
      List<dynamic> postMaps = response.data;
      return postMaps.map((post) => ImagesModel.fromJson(post)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
