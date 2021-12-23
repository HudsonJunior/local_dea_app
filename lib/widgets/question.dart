import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class QuestionWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String answer;
  final VoidCallback onTap;

  const QuestionWidget({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.answer,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(width: 12.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Palette.primary,
                  ),
                  const SizedBox(width: 12.0),
                ],
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: !isSelected
                ? const Duration(milliseconds: 300)
                : const Duration(milliseconds: 0),
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceOut,
            child: isSelected
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 4.0,
                            offset: Offset(0.75, 0.0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          answer,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
