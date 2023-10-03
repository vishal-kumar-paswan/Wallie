import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ImagesAPI {
  final Dio _dio = Dio();

  ImagesAPI() {
    _dio.options.baseUrl = "https://api.unsplash.com";
    _dio.options.headers = {
      "Authorization": "Client-ID ${dotenv.env['CLIENTID']}"
    };
    // For development / debugging
    // _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
