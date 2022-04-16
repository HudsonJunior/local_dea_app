import 'package:flutter/material.dart';

class TextStepGuideRich extends StatelessWidget {
  const TextStepGuideRich({
    Key? key,
    required this.title,
  }) : super(key: key);

  final TextSpan title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.circle,
          size: 10,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text.rich(title),
        ),
      ],
    );
  }
}
