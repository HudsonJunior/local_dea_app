import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/view/widgets/map/route_info_item.dart';

class RouteInfoWidget extends StatelessWidget {
  const RouteInfoWidget({
    Key? key,
    required this.distance,
    required this.duration,
    required this.onCleanRoute,
  }) : super(key: key);

  final int distance;
  final int duration;
  final VoidCallback onCleanRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight + 8.0),
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RouteInfoItem(
              label: duration.formatDuration,
              icon: FontAwesomeIcons.solidClock,
            ),
            RouteInfoItem(
              label: distance.formatDistance,
              icon: FontAwesomeIcons.locationPin,
            ),
            GestureDetector(
              onTap: onCleanRoute,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        size: 15,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Limpar rota',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension RouteInfoExt on int {
  String get formatDistance {
    if (this >= 1000) {
      final converted = this ~/ 1000;
      final resto = this % 1000;
      return '$converted${',${resto.toString().characters.elementAt(0)} km'}';
    } else {
      return '$this m';
    }
  }

  String get formatDuration {
    final converted = this ~/ 60;
    final resto = this % 60;
    return '${converted.toString().padLeft(2, '0')}h:${resto.toString().padLeft(2, '0')}m';
  }
}
