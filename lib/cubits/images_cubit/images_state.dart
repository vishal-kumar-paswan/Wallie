import 'package:wallie/models/images_model.dart';

abstract class ImagesState {}

class ImagesLoadingState extends ImagesState {}

class ImagesLoadedState extends ImagesState {
  final List<ImagesModel> images;
  ImagesLoadedState(this.images);
}

class ImagesErrorState extends ImagesState {
  final String error;
  ImagesErrorState(this.error);
}
