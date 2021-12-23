import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/widgets/route_method_item.dart';

class RouteMethodWidget extends StatefulWidget {
  const RouteMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RouteMethodWidgetState createState() => _RouteMethodWidgetState();
}

enum RouteMethodEnum { car, bike, feet }

class _RouteMethodWidgetState extends State<RouteMethodWidget> {
  RouteMethodEnum selectedMethod = RouteMethodEnum.feet;

  void changeMethod(RouteMethodEnum method) {
    setState(() {
      selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8.0,
      spacing: 48.0,
      children: [
        RouteMethodItem(
          tip: 'Buscar DEA a pé',
          icon: FontAwesomeIcons.walking,
          isSelected: selectedMethod == RouteMethodEnum.feet,
          onTap: () => changeMethod(RouteMethodEnum.feet),
        ),
        RouteMethodItem(
          tip: 'Buscar DEA de bicicleta',
          icon: FontAwesomeIcons.bicycle,
          onTap: () => changeMethod(RouteMethodEnum.bike),
          isSelected: selectedMethod == RouteMethodEnum.bike,
        ),
        RouteMethodItem(
          tip: 'Buscar DEA de carro',
          isSelected: selectedMethod == RouteMethodEnum.car,
          icon: FontAwesomeIcons.car,
          onTap: () => changeMethod(RouteMethodEnum.car),
        ),
      ],
    );
  }
}
