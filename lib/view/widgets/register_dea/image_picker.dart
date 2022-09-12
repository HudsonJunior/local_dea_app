import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Card(
            color: Palette.redGradient2,
            elevation: 12.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    FontAwesomeIcons.camera,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Adicionar foto',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 48.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dea_icon.png',
              width: 80,
              height: 80,
            ),
            const Text(
              'Local DEA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
