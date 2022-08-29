import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackBar {
  static SnackBar snackbar(String message, bool success) {
    return SnackBar(
      elevation: 5.0,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: !success ? Colors.redAccent : Colors.green[350],
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static show(BuildContext context, String message, {bool success = true}) {
    showTopSnackBar(
      context,
      Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: success ? Colors.green : Palette.redGradient2,
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              success ? Icons.check : Icons.warning,
              color: Colors.white,
              size: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: MediaQuery.of(context).viewInsets.top + 16,
      ),
      displayDuration: const Duration(milliseconds: 3000),
      animationDuration: const Duration(milliseconds: 800),
    );
  }
}
