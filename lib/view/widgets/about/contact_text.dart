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
      children: [
        Icon(
          icon,
          color: Colors.white,
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
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
