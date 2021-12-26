import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/widgets/about/contact_text.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.primary,
        title: const AppBarContent(
          title: 'Sobre',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Projeto desenvolvido como trabalho de conclusão de curso de Ciência da Computaçação e projeto PIBITI na Universidade Estadual de Maringá',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: Colors.white,
              thickness: 1.1,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Desenvolvido pelo discente Hudson Júnior em parceria com projeto PIBITI da Giovana Eiri.',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contato',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            const ContactTextWidget(
              icon: Icons.mail,
              text: 'hudsonrogeriojunior@hotmail.com',
            ),
            const SizedBox(height: 8.0),
            const ContactTextWidget(
              icon: Icons.phone,
              text: '44 997215496',
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/dea_icon.png',
                  width: 80,
                  height: 80,
                ),
                const Text(
                  'LOCAL\nDEA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.secondary,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
