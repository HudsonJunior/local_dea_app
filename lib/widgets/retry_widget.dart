import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({
    Key? key,
    required this.message,
    required this.onRetry,
  }) : super(key: key);

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Palette.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: onRetry,
                icon: const Icon(
                  Icons.refresh,
                  color: Palette.secondary,
                ),
                label: const Text(
                  'Tentar novamente',
                  style: TextStyle(
                    color: Palette.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
