import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';

class ShaderGradient extends StatelessWidget {
  const ShaderGradient({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Palette.redGradient1,
            Palette.redGradient2,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }
}
