import 'package:flutter/material.dart';

import 'package:local_dea_app/constraints/colors.dart';

class AppBarContent extends StatelessWidget {
  final String title;

  const AppBarContent({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
