import 'package:flutter/material.dart';
import 'package:local_dea_app/view/widgets/register_dea/checkbox.dart';

class PrivateServiceCheckbox extends StatelessWidget {
  const PrivateServiceCheckbox({
    Key? key,
    required this.isChecked,
    required this.onChecked,
  }) : super(key: key);

  final bool isChecked;
  final Function(bool?) onChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onChecked: onChecked),
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
