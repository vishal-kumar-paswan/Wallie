import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void routeToHomeScreen(BuildContext ctx) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(ctx, "/homescreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    routeToHomeScreen(context);
    return Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontSize: 50.0,
            fontFamily: GoogleFonts.pacifico().fontFamily,
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText(
                'Wallie.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
