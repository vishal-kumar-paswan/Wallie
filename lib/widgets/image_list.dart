import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallie/cubits/images_cubit/images_cubit.dart';
import 'package:wallie/cubits/images_cubit/images_state.dart';
import 'package:wallie/models/images_model.dart';
import 'package:wallie/widgets/drawer.dart';

class ImageListView extends StatelessWidget {
  const ImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Text(
          'Wallie.',
          style: GoogleFonts.pacifico(
            fontSize: 33,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          if (state is ImagesLoadingState) {
            return Center(
              child: Transform.scale(
                scale: 3.5,
                child: Lottie.asset(
                  'assets/animations/loading_animation.json',
                  repeat: true,
                ),
              ),
            );
          }
          if (state is ImagesLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  ImagesModel image = state.images[index];

                  Map<String, dynamic>? imageUrls = image.urls;

                  return imageCard(imageUrls!, index, context);
                },
              ),
            );
          }
          return const Center(
            child: Text(
              "Oops, failed to connect to servers! :')",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget imageCard(
      Map<String, dynamic> imageUrls, int index, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: InkWell(
        onTap: () {
          Map<String, dynamic> arguments = {
            "imageUrl": imageUrls['regular'].toString(),
            "index": index
          };

          Navigator.pushNamed(
            context,
            "/imagescreen",
            arguments: arguments, // Passing arguments as Map
          );
        },
        child: Hero(
          tag: 'image$index',
          child: CachedNetworkImage(
            imageUrl: imageUrls['small'].toString(),
            placeholder: (context, url) {
              return Image.memory(kTransparentImage);
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
