import 'package:flutter/material.dart';
import 'package:local_dea_app/resources/launcher_service.dart';

class InfoWindowLabel extends StatelessWidget {
  const InfoWindowLabel({
    Key? key,
    required this.icon,
    required this.label,
    this.showButton = false,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color iconColor;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 16.0),
        Flexible(
          flex: 1,
          child: Text(
            label,
            maxLines: 3,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        if (showButton)
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                LauncherManager.instance.launchDialer(label);
              },
              child: Card(
                margin: const EdgeInsets.only(left: 12.0),
                color: Colors.redAccent,
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.call,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Ligar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
