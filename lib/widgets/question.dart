import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';

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
          Tooltip(
            textStyle: const TextStyle(
              fontSize: 18.0,
              color: Palette.primary,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Palette.primary,
              ),
            ),
            message: title,
            child: Card(
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
                    Expanded(
                      flex: 4,
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.primary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Palette.primary,
                    ),
                    const SizedBox(width: 12.0),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 350),
            firstCurve: Curves.elasticIn,
            secondCurve: Curves.elasticOut,
            crossFadeState: isSelected
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Palette.primary,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        answer,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
