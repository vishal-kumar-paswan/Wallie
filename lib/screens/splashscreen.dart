import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallie/screens/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void routeToHomePage(BuildContext ctx) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    routeToHomePage(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/splashscreen_background.jpg'),
            fit: BoxFit.cover,
            opacity: 1,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.45),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Wallie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 68,
                      fontFamily: GoogleFonts.pacifico().fontFamily,
                    ),
                  ),
                  Text(
                    'Wrap your screen in elegance.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
