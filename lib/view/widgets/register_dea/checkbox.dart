import 'package:flutter/material.dart';

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
          activeColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          checkColor: Colors.black,
        ),
      );
}
