import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/blocs/route_method_cubit.dart';
import 'package:local_dea_app/models/route_method_model.dart';
import 'package:local_dea_app/widgets/route_method_item.dart';

class RouteMethodWidget extends StatefulWidget {
  const RouteMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RouteMethodWidget> createState() => _RouteMethodWidgetState();
}

class _RouteMethodWidgetState extends State<RouteMethodWidget> {
  late final RouteMethodCubit routeMethodCubit;

  @override
  void initState() {
    super.initState();
    routeMethodCubit = BlocProvider.of<RouteMethodCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteMethodCubit, RouteMethodEnum>(
        bloc: routeMethodCubit,
        builder: (context, method) {
          return Wrap(
            direction: Axis.horizontal,
            runSpacing: 8.0,
            spacing: 48.0,
            children: [
              RouteMethodItem(
                tip: 'Buscar DEA a pé',
                icon: FontAwesomeIcons.walking,
                isSelected: method == RouteMethodEnum.pedestrian,
                onTap: () => routeMethodCubit
                    .selectRouteMethod(RouteMethodEnum.pedestrian),
              ),
              RouteMethodItem(
                tip: 'Buscar DEA de bicicleta',
                icon: FontAwesomeIcons.bicycle,
                onTap: () =>
                    routeMethodCubit.selectRouteMethod(RouteMethodEnum.bicycle),
                isSelected: method == RouteMethodEnum.bicycle,
              ),
              RouteMethodItem(
                tip: 'Buscar DEA de carro',
                isSelected: method == RouteMethodEnum.car,
                icon: FontAwesomeIcons.car,
                onTap: () =>
                    routeMethodCubit.selectRouteMethod(RouteMethodEnum.car),
              ),
            ],
          );
        });
  }
}
