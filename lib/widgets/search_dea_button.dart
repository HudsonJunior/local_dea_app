import 'package:flutter/material.dart';
import 'package:local_dea_app/widgets/loading_widget.dart';

class SearchDeaButton extends StatelessWidget {
  const SearchDeaButton({
    Key? key,
    this.label,
    required this.onPress,
    this.isLoading = false,
  }) : super(key: key);

  final String? label;
  final VoidCallback onPress;
  final bool isLoading;

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
              : Text(
                  label ?? 'BUSCAR DEA',
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
        ),
      ),
    );
  }
}
