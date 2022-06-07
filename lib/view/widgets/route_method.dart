import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/domain/models/route_method_model.dart';
import 'package:local_dea_app/view/blocs/route_method_cubit.dart';
import 'package:local_dea_app/view/widgets/route_method_item.dart';

class RouteMethodWidget extends StatefulWidget {
  const RouteMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RouteMethodWidget> createState() => _RouteMethodWidgetState();
}

class _RouteMethodWidgetState extends State<RouteMethodWidget> {
  late final RouteMethodCubit routeMethodCubit;
  late final PageController pageController;

  late Widget centerWidget;
  @override
  void initState() {
    super.initState();
    routeMethodCubit = BlocProvider.of<RouteMethodCubit>(context);
    pageController = PageController(initialPage: 1, viewportFraction: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: BlocBuilder<RouteMethodCubit, RouteMethodEnum>(
          builder: (context, method) {
        return PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = RouteMethodEnum.values[index % 3];

            return RouteMethodItem(
              tip: item.tip,
              icon: item.icon,
              onTap: () {
                routeMethodCubit.selectRouteMethod(
                  item,
                );
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              isSelected: item == method,
            );
          },
          onPageChanged: (value) {
            routeMethodCubit.selectRouteMethod(
              RouteMethodEnumExt.fromInt(value % 3),
            );
          },
          controller: pageController,
        );
      }),
    );
  }
}
