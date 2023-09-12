import 'package:flutter/material.dart';

class DisplaySnackbar {
  DisplaySnackbar(
      {required this.context, required this.message, required this.color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              message,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
  final String message;
  final BuildContext context;
  final Color color;
}
