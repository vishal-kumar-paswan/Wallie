import 'package:flutter/material.dart';
import 'package:wallie/widgets/wallie.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String description = 'Wrap your screen in elegance.';
  final String version = 'Version 1.0.0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Wallie(),
              Text(
                version,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 25,
            child: Column(
              children: [
                const Text(
                  'Powered by',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Image.asset(
                  'assets/images/unsplash_logo.png',
                  width: 140,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
