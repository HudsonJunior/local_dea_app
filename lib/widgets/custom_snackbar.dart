import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class CustomSnackBar {
  static SnackBar snackbar(String message) => SnackBar(
        elevation: 5.0,
        backgroundColor: Palette.secondary,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static show(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        snackbar(message),
      );
}
