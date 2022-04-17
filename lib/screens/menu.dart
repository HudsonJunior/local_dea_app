import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/blocs/auth/auth.dart';
import 'package:local_dea_app/resources/launcher_service.dart';
import 'package:local_dea_app/screens/about.dart';
import 'package:local_dea_app/screens/auth.dart';
import 'package:local_dea_app/screens/dea_guide.dart';
import 'package:local_dea_app/screens/frequently_questions.dart';
import 'package:local_dea_app/screens/register_dea.dart';
import 'package:local_dea_app/widgets/custom_snackbar.dart';
import 'package:local_dea_app/widgets/menu_card.dart';
import 'package:page_transition/page_transition.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          MenuCard(
            onTap: () {
              if (context.read<AuthBloc>().state is! AuthSucceedState) {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.center,
                    child: const AuthScreen(),
                  ),
                );
              } else {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.center,
                    child: const RegisterDeaScreen(),
                  ),
                );
              }
            },
            icon: Icons.location_on,
            title: 'Cadastrar Serviço',
          ),
          const SizedBox(height: 12.0),
          MenuCard(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const FrequentlyQuestionsScreen(),
                ),
              );
            },
            icon: FontAwesomeIcons.solidCircleQuestion,
            title: 'Perguntas frequentes',
          ),
          const SizedBox(height: 12.0),
          MenuCard(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const DeaGuideScreen(),
                ),
              );
            },
            icon: FontAwesomeIcons.bookMedical,
            title: 'Guia de RCP',
          ),
          const SizedBox(height: 12.0),
          MenuCard(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const AboutScreen(),
                ),
              );
            },
            icon: FontAwesomeIcons.circleInfo,
            title: 'Sobre',
          ),
          const SizedBox(height: 12.0),
          MenuCard(
            onTap: () async {
              try {
                LauncherManager.instance.launchMailer();
              } on Exception {
                CustomSnackBar.show(
                  context,
                  'Não foi possível abrir aplicativo de e-mail.',
                );
              }
            },
            icon: FontAwesomeIcons.solidComment,
            title: 'Enviar sugestão',
          ),
          const Spacer(),
          Image.asset('assets/dea_icon.png'),
          const SizedBox(height: 12),
          const Text(
            'Local DEA',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
