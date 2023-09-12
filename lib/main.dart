import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallie/routes.dart';

void main() async {
  await dotenv.load();
  runApp(const Wallie());
}

class Wallie extends StatelessWidget {
  const Wallie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/splashscreen",
    );
  }
}
