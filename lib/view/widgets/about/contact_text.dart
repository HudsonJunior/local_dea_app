import 'package:flutter/material.dart';

class ContactTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.black87,
          size: 16,
        ),
        const SizedBox(width: 8.0),
        SelectableText(
          text,
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
