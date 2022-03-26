import 'package:flutter/material.dart';

class InfoWindowLabel extends StatelessWidget {
  const InfoWindowLabel({
    Key? key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            label,
            maxLines: 3,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
