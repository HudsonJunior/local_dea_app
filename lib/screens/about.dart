import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'O aplicativo DEA foi desenvolvido nos projetos de TCC e PIBITI, por Hudon Junior e Giovanna Eiri, respectivamente, discentes dos curso de Ciência da Computação e Medicina da Universidade Estadual de Maringá.',
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
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 24.0),
            const Text(
              'O objetivo principal do aplicativo é tornar as localizações de Desfibriladores Externos Automáticos e serviços emergenciais de saúde mais acessíveis na região de Maringá, Paraná.',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 48.0),
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
              text: 'ra108756@uem.br',
            ),
            const SizedBox(height: 8.0),
            const ContactTextWidget(
              icon: Icons.mail,
              text: 'ra107310@uem.br',
            ),
            const SizedBox(height: 8.0),
            const ContactTextWidget(
              icon: Icons.mail,
              text: 'hmpteixeira@uem.br',
            ),
            const SizedBox(height: 8.0),
            const ContactTextWidget(
              icon: Icons.mail,
              text: 'landrade@uem.br',
            ),
          ],
        ),
      ),
    );
  }
}
