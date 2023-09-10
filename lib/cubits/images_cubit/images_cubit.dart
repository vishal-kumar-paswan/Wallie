import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallie/cubits/images_cubit/images_state.dart';
import 'package:wallie/models/images_model.dart';
import 'package:wallie/services/repositories/images_repository.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesLoadingState()) {
    _fetchData();
  }

  final ImagesRepository _postRepository = ImagesRepository();

  void _fetchData() async {
    try {
      List<ImagesModel> images = await _postRepository.fetchImages();
      emit(ImagesLoadedState(images));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        emit(
          ImagesErrorState(
              "Can't fetch posts, check your internet and try again"),
        );
      } else {
        emit(ImagesErrorState(e.message.toString()));
      }
    }
  }
}
