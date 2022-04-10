import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/widgets/loading_widget.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.onRegisterDea,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback onRegisterDea;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onRegisterDea,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLoading
              ? const SizedBox(
                  child: LoadingWidget(),
                  height: 20,
                  width: 20,
                )
              : const Text(
                  'Cadastrar serviço',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Palette.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
