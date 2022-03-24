import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/dea_guide/carousel_indicator.dart';

class DeaGuideScreen extends StatefulWidget {
  const DeaGuideScreen({Key? key}) : super(key: key);

  @override
  State<DeaGuideScreen> createState() => _DeaGuideScreenState();
}

class _DeaGuideScreenState extends State<DeaGuideScreen> {
  final pages = <Image>[
    Image.asset('assets/Fluxo1.png'),
    Image.asset('assets/Fluxo2.png'),
    Image.asset('assets/Fluxo3.png'),
    Image.asset('assets/Fluxo4.png'),
    Image.asset('assets/Fluxo5.png'),
    Image.asset('assets/Fluxo6.png'),
  ];

  Widget buildItem(Image page) {
    return RotatedBox(
      child: page,
      quarterTurns: 1,
    );
  }

  int _currentPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Palette.primary,
          title: const AppBarContent(
            title: 'Guia prático',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  _controller.previousPage();
                },
                icon: const Icon(
                  FontAwesomeIcons.arrowCircleUp,
                  color: Palette.primary,
                  size: 30,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    CarouselIndicatorWidget(
                      pagesCount: pages.length,
                      currentPage: _currentPage,
                      onChangePage: (index) {
                        _controller.animateToPage(index);
                      },
                    ),
                    Expanded(
                      child: CarouselSlider(
                        carouselController: _controller,
                        items: pages.map((page) => buildItem(page)).toList(),
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                          viewportFraction: 1.0,
                          onPageChanged: (index, _) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  _controller.nextPage();
                },
                icon: const Icon(
                  FontAwesomeIcons.arrowCircleDown,
                  color: Palette.primary,
                  size: 30,
                ),
              ),
            ],
          ),
        ));
  }
}
