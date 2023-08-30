import 'package:flutter/material.dart';
import 'package:wallie/screens/splashscreen.dart';

void main() => runApp(const Wallie());

class Wallie extends StatelessWidget {
  const Wallie({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
