import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Palette.primary,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BackButton(
              color: Colors.white,
            ),
            Image.asset(
              'assets/dea_icon.png',
              width: 50,
              height: 50,
            ),
            const Expanded(
              child: Text(
                'PARADA CARDÍACA:\nO QUE FAZER?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
