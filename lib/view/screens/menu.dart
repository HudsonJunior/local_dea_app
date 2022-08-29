import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/infra/resources/launcher_service.dart';
import 'package:local_dea_app/view/blocs/auth/auth.dart';
import 'package:local_dea_app/view/screens/about.dart';
import 'package:local_dea_app/view/screens/auth.dart';
import 'package:local_dea_app/view/screens/dea_guide.dart';
import 'package:local_dea_app/view/screens/frequently_questions.dart';
import 'package:local_dea_app/view/screens/register_dea.dart';
import 'package:local_dea_app/view/widgets/custom_snackbar.dart';
import 'package:local_dea_app/view/widgets/menu_card.dart';
import 'package:page_transition/page_transition.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late final AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

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
            icon: FontAwesomeIcons.fileWaveform,
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
                  success: false,
                );
              }
            },
            icon: FontAwesomeIcons.solidComment,
            title: 'Enviar sugestão',
          ),
          const SizedBox(height: 12.0),
          BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              if (state is AuthSucceedState) {
                return MenuCard(
                  onTap: () {
                    authBloc.add(AuthLogoutEvent());
                    Navigator.of(context).pop();
                    CustomSnackBar.show(
                      context,
                      "Logout realizado com sucesso",
                    );
                  },
                  icon: Icons.logout_rounded,
                  title: "Sair",
                );
              }

              return const SizedBox.shrink();
            },
          ),
          const Spacer(),
          AspectRatio(
            aspectRatio: 3,
            child: Image.asset(
              'assets/dea_icon.png',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Local DEA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
