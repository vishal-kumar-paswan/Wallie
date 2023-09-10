import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.cloud_off_outlined,
              size: 42,
            ),
            Text(
              'No internet',
              style: TextStyle(
                fontSize: 25,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Text(
              'Connection',
              style: TextStyle(
                fontSize: 40,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Please check your internet and try again :)',
              style: TextStyle(
                fontSize: 17,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
