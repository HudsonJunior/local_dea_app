import 'package:flutter/material.dart';
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
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLoading
              ? const LoadingWidget(color: Colors.white)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon),
                    const SizedBox(width: 8.0),
                    Text(
                      label ?? 'BUSCAR DEA',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
