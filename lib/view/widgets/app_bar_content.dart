import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
  final String title;

  const AppBarContent({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white),
    );
  }
}
