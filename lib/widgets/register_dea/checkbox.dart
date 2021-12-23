import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.isChecked,
    required this.onChecked,
  }) : super(key: key);

  final bool isChecked;
  final Function(bool?) onChecked;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30,
        width: 30,
        child: Checkbox(
          value: isChecked,
          splashRadius: 0.0,
          onChanged: onChecked,
          side: const BorderSide(color: Colors.white, width: 2.0),
          activeColor: Palette.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          checkColor: Colors.black,
        ),
      );
}
