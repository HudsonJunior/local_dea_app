import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/screens/menu.dart';
import 'package:local_dea_app/widgets/map/emergency_fab.dart';
import 'package:local_dea_app/widgets/map/map_widget.dart';
import 'package:local_dea_app/widgets/route_method.dart';
import 'package:local_dea_app/widgets/search_dea_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const Text(
              'Local DEA',
            ),
          ],
        ),
        actions: [
          Flexible(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MenuScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.menu,
                size: 35,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: Stack(
        children: [
          const MapWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                RouteMethodWidget(),
                SizedBox(height: 18.0),
                SearchDeaButton(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const EmergencyFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
