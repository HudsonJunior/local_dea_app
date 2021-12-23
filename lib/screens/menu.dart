import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/screens/frequently_questions.dart';
import 'package:local_dea_app/screens/register_dea.dart';
import 'package:local_dea_app/widgets/menu_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.primary,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dea_icon.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8.0),
            const Expanded(
                child: Text(
              'Local DEA - Menu',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            MenuCard(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const FrequentlyQuestionsScreen(),
                  ),
                );
              },
              icon: FontAwesomeIcons.questionCircle,
              title: 'Perguntas frequentes',
            ),
            const SizedBox(height: 12.0),
            MenuCard(
              onTap: () {},
              icon: FontAwesomeIcons.infoCircle,
              title: 'Sobre',
            ),
            const SizedBox(height: 12.0),
            MenuCard(
              onTap: () {},
              icon: FontAwesomeIcons.comment,
              title: 'Sugestões',
            ),
            const SizedBox(height: 12.0),
            MenuCard(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RegisterDeaScreen(),
                  ),
                );
              },
              icon: Icons.location_on,
              title: 'Cadastrar Serviço',
            )
          ],
        ),
      ),
    );
  }
}
