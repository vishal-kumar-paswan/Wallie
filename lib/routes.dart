import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallie/cubits/internet_cubit/internet_cubit.dart';
import 'package:wallie/screens/about_screen.dart';
import 'package:wallie/screens/home_screen.dart';
import 'package:wallie/screens/image_screen.dart';
import 'package:wallie/widgets/no_internet_widget.dart';
import 'package:wallie/screens/splash_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    Map<String, dynamic> arguments;

    switch (settings.name) {
      case "/splashscreen":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case "/homescreen":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InternetCubit(),
            child: const HomeScreen(),
          ),
        );

      case "/nointernetscreen":
        return MaterialPageRoute(
          builder: (context) => const NoInternetScreen(),
        );

      case "/image":
        //fetching arguments passed while navigating as map
        arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ImageScreen(
            imageUrl: arguments["imageUrl"],
            index: arguments["index"],
          ),
        );

      case "/about":
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      default:
        return null;
    }
  }
}
