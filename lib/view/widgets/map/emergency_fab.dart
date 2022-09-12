import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/infra/resources/launcher_service.dart';
import 'package:local_dea_app/view/widgets/custom_snackbar.dart';

class EmergencyFab extends StatefulWidget {
  const EmergencyFab({Key? key}) : super(key: key);

  @override
  _EmergencyFabState createState() => _EmergencyFabState();
}

class _EmergencyFabState extends State<EmergencyFab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: FloatingActionButton.extended(
        onPressed: () async {
          try {
            LauncherManager.instance.launchDialer('192');
          } on Exception {
            CustomSnackBar.show(
              context,
              'Não foi possível ligar para o SAMU',
              success: false,
            );
          }
        },
        clipBehavior: Clip.hardEdge,
        extendedPadding: EdgeInsets.zero,
        extendedIconLabelSpacing: 0,
        label: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Palette.redGradient1, Palette.redGradient2],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Row(
            children: const [
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('Ligar SAMU'),
            ],
          )),
        ),
      ),
    );
  }
}
