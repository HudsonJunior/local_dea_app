import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/view/widgets/loading_widget.dart';

class LocalDeaButton extends StatelessWidget {
  const LocalDeaButton({
    Key? key,
    this.label,
    required this.onPress,
    this.isLoading = false,
    required this.icon,
  }) : super(key: key);

  final String? label;
  final VoidCallback onPress;
  final bool isLoading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Palette.redGradient1, Palette.redGradient2],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) const LoadingWidget(),
                if (!isLoading) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: 8.0),
                  Text(
                    label ?? 'BUSCAR DEA',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
