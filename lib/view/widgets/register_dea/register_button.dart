import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/view/widgets/loading_widget.dart';

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
          padding: EdgeInsets.zero,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onRegisterDea,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Palette.redGradient1, Palette.redGradient2],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: isLoading
              ? const Center(child: LoadingWidget())
              : const Center(
                  child: Text(
                    'Cadastrar serviço',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
