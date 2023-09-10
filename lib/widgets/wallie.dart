import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallie extends StatelessWidget {
  const Wallie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Wallie',
      style: GoogleFonts.pacifico(
        fontSize: 50,
        color: Colors.black,
      ),
    );
  }
}
