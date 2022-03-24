import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class CarouselIndicatorWidget extends StatelessWidget {
  const CarouselIndicatorWidget({
    Key? key,
    required this.pagesCount,
    required this.currentPage,
    required this.onChangePage,
  }) : super(key: key);

  final int pagesCount;
  final int currentPage;
  final ValueSetter<int> onChangePage;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pagesCount,
          (index) => InkWell(
            onTap: () => onChangePage(index),
            child: Container(
              height: 12.0,
              width: 12.0,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.primary.withOpacity(
                  currentPage == index ? 0.9 : 0.4,
                ),
              ),
            ),
          ),
        ));
  }
}
