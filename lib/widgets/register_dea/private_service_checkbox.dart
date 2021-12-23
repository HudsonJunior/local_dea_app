import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/widgets/register_dea/checkbox.dart';

class PrivateServiceCheckbox extends StatelessWidget {
  const PrivateServiceCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: true, onChecked: (t) {}),
        const SizedBox(width: 8.0),
        const Text(
          'É um serviço privado',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
