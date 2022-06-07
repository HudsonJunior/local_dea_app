import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum RouteMethodEnum { car, bicycle, pedestrian }

extension RouteMethodEnumExt on RouteMethodEnum {
  IconData get icon {
    switch (this) {
      case RouteMethodEnum.car:
        return FontAwesomeIcons.car;
      case RouteMethodEnum.bicycle:
        return FontAwesomeIcons.bicycle;
      case RouteMethodEnum.pedestrian:
        return FontAwesomeIcons.personWalking;
    }
  }

  static RouteMethodEnum fromInt(int value) {
    switch (value) {
      case 0:
        return RouteMethodEnum.car;
      case 1:
        return RouteMethodEnum.bicycle;
      default:
        return RouteMethodEnum.pedestrian;
    }
  }

  String get tip {
    switch (this) {
      case RouteMethodEnum.car:
        return "Buscar DEA de carro";
      case RouteMethodEnum.bicycle:
        return "Buscar DEA de bicileta";
      case RouteMethodEnum.pedestrian:
        return "Buscar DEA a pé";
    }
  }
}
