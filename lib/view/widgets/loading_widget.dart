import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
