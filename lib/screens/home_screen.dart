import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallie/cubits/images_cubit/images_cubit.dart';
import 'package:wallie/cubits/internet_cubit/internet_cubit.dart';
import 'package:wallie/widgets/image_list.dart';
import 'package:wallie/widgets/no_internet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state == InternetState.lost) {
          return const NoInternetScreen();
        } else {
          return BlocProvider(
            create: (context) => ImagesCubit(),
            child: const ImageListView(),
          );
        }
      },
    );
  }
}
