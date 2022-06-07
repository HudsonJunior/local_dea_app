import 'package:flutter/material.dart';
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
            );
          }
        },
        backgroundColor: Colors.red,
        label: const Text('Ligar para o SAMU'),
        icon: const Icon(Icons.phone),
      ),
    );
  }
}
