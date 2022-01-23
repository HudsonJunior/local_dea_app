import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Palette.primary,
      ),
    );
  }
}
