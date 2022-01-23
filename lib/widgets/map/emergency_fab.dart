import 'package:flutter/material.dart';

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
        onPressed: () {},
        backgroundColor: Colors.red,
        label: const Text('Ligar emergência'),
        icon: const Icon(Icons.phone),
      ),
    );
  }
}
