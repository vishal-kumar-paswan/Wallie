import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'image$index',
          child: FadeInImage(
            key: UniqueKey(),
            height: double.infinity,
            width: double.infinity,
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
