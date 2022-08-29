import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Tooltip(
              textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              message: title,
              child: Card(
                color: Colors.white,
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
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: isSelected
                            ? const Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.black87,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black87,
                              ),
                      ),
                      const SizedBox(width: 12.0),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSlide(
              offset: Offset(isSelected ? 0 : -2, 0),
              duration: const Duration(
                milliseconds: 400,
              ),
              curve: Curves.easeOut,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                                  color: Colors.red,
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
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
