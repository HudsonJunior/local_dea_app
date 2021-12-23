import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

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
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
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
