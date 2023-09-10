import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallie/cubits/internet_cubit/internet_cubit.dart';
import 'package:wallie/screens/home_screen.dart';
import 'package:wallie/screens/no_internet_screen.dart';
import 'package:wallie/screens/splash_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
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
      default:
    }
    return null;
  }
}
