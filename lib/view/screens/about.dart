import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/view/widgets/about/contact_text.dart';
import 'package:local_dea_app/view/widgets/app_bar_content.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    onChangeOpacity();
  }

  void onChangeOpacity() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 0.5;
      });
    });

    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Palette.redGradient1, Palette.redGradient2],
            ),
          ),
        ),
        title: const AppBarContent(
          title: 'Sobre',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 300),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Text(
                'O aplicativo DEA foi desenvolvido nos projetos de TCC e PIBITI, por Hudson Junior e Giovanna Eiri, respectivamente, discentes dos curso de Ciência da Computação e Medicina da Universidade Estadual de Maringá.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8.0),
              const Divider(
                color: Colors.black87,
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
                      color: Palette.redGradient2,
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
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 48.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contato',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
