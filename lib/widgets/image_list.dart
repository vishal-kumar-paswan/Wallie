import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    'Loading your gallery..',
                    textStyle: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ImagesLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  ImagesModel image = state.images[index];
                  return imageCard(image, index, context);
                },
              ),
            );
          }
          return const Center(
            child: Text("An error occured"),
          );
        },
      ),
    );
  }

  Widget imageCard(ImagesModel image, int index, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: InkWell(
        onTap: () {
          Map<String, dynamic> arguments = {
            "imageUrl": image.regular.toString(),
            "index": index
          };

          Navigator.pushNamed(
            context,
            "/image",
            arguments: arguments, // Passing arguments as Map
          );
        },
        child: Hero(
          tag: 'image$index',
          child: FadeInImage(
            key: UniqueKey(),
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(image.regular.toString()),
            fadeInCurve: Curves.easeInOut,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
