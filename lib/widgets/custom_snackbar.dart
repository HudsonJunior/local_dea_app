import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar snackbar(String message, bool success) => SnackBar(
        elevation: 5.0,
        backgroundColor: !success ? Colors.redAccent : Colors.greenAccent,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static show(BuildContext context, String message, {bool? success}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        snackbar(message, success ?? true),
      );
}
