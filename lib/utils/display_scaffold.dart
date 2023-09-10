import 'package:flutter/material.dart';

class DisplayScaffold {
  DisplayScaffold({required this.context, required this.message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
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
}
