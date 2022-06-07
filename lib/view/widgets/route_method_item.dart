import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';

class RouteMethodItem extends StatelessWidget {
  final String tip;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final PageController pageController;

  const RouteMethodItem({
    Key? key,
    required this.tip,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isSelected)
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Flexible(
              child: Card(
                color: Palette.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      tip,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        Flexible(
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
