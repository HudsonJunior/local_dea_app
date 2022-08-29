import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/view/widgets/custom_appbar.dart';
import 'package:local_dea_app/view/widgets/dea_guide/carousel_indicator.dart';
import 'package:local_dea_app/view/widgets/dea_guide/guide_step1.dart';
import 'package:local_dea_app/view/widgets/dea_guide/guide_step2.dart';
import 'package:local_dea_app/view/widgets/dea_guide/guide_step3.dart';
import 'package:local_dea_app/view/widgets/dea_guide/guide_step4.dart';
import 'package:local_dea_app/view/widgets/shader_gradient.dart';

class DeaGuideScreen extends StatefulWidget {
  const DeaGuideScreen({Key? key}) : super(key: key);

  @override
  State<DeaGuideScreen> createState() => _DeaGuideScreenState();
}

class _DeaGuideScreenState extends State<DeaGuideScreen> {
  final _items = <Widget>[
    const GuideStep1(),
    const GuideStep2(),
    const GuideStep3(),
    const GuideStep4(),
  ];

  int _currentPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CarouselSlider(
                  carouselController: _controller,
                  items: _items.map((item) => item).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
              ),
              const Divider(
                color: Palette.redGradient1,
                thickness: 1.5,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderGradient(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          _controller.previousPage();
                        },
                        splashColor: Palette.redGradient1.withOpacity(0.3),
                        icon: const Icon(
                          FontAwesomeIcons.circleArrowLeft,
                          color: Palette.redGradient1,
                        ),
                      ),
                    ),
                  ),
                  CarouselIndicatorWidget(
                    pagesCount: _items.length,
                    currentPage: _currentPage,
                    onChangePage: (index) {
                      _controller.animateToPage(index);
                    },
                  ),
                  ShaderGradient(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        iconSize: 50,
                        splashColor: Palette.redGradient1.withOpacity(0.3),
                        onPressed: () {
                          _controller.nextPage();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.circleArrowRight,
                          color: Palette.redGradient1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
