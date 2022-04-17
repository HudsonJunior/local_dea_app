import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';

class RouteMethodItem extends StatelessWidget {
  final String tip;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final double turns;

  const RouteMethodItem({
    Key? key,
    required this.tip,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.turns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstChild: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tip,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            color: Palette.primary,
          ),
          secondChild: const SizedBox.shrink(),
          crossFadeState:
              isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        AnimatedRotation(
          duration: Duration(milliseconds: isSelected ? 1000 : 0),
          turns: turns,
          child: Tooltip(
            message: tip,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: isSelected ? 55 : 45,
                height: isSelected ? 55 : 45,
                decoration: const BoxDecoration(
                  color: Palette.primary,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Palette.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: FaIcon(
                        icon,
                        size: isSelected ? 30 : 22,
                        color: isSelected ? Palette.primary : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
