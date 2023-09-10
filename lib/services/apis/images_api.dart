import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ImagesAPI {
  final Dio _dio = Dio();

  ImagesAPI() {
    _dio.options.baseUrl =
        "https://970d-2405-201-800d-805f-cd9f-5d96-e26a-9585.ngrok-free.app";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
