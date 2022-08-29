import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const MenuCard({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [Colors.black54, Colors.black87],
                  ).createShader(
                    bounds,
                  );
                },
                child: FaIcon(
                  icon,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(width: 18.0),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
