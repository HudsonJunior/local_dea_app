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

  late Widget centerWidget;
  @override
  void initState() {
    super.initState();
    routeMethodCubit = BlocProvider.of<RouteMethodCubit>(context);
  }

  List<RouteMethodEnum> items = <RouteMethodEnum>[
    RouteMethodEnum.car,
    RouteMethodEnum.bicycle,
    RouteMethodEnum.pedestrian
  ];

  void onChangeItems(int currentIndex) async {
    final aux = items[1];

    setState(() {
      items[1] = items[currentIndex];
      items[currentIndex] = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteMethodCubit, RouteMethodEnum>(
        bloc: routeMethodCubit,
        builder: (context, method) {
          final itemsWidget = items.map((mapMethod) {
            if (mapMethod == RouteMethodEnum.car) {
              return RouteMethodItem(
                key: Key(mapMethod.name),
                turns: method == RouteMethodEnum.car ? 1 : 0,
                tip: 'Buscar DEA de carro',
                isSelected: method == RouteMethodEnum.car,
                icon: FontAwesomeIcons.car,
                onTap: () {
                  if (method != RouteMethodEnum.car) {
                    routeMethodCubit.selectRouteMethod(RouteMethodEnum.car);
                    onChangeItems(
                      items.indexOf(RouteMethodEnum.car),
                    );
                  }
                },
              );
            }
            if (mapMethod == RouteMethodEnum.bicycle) {
              return RouteMethodItem(
                key: Key(mapMethod.name),
                turns: method == RouteMethodEnum.bicycle ? 1 : 0,
                tip: 'Buscar DEA de bicicleta',
                icon: FontAwesomeIcons.bicycle,
                onTap: () {
                  if (method != RouteMethodEnum.bicycle) {
                    routeMethodCubit.selectRouteMethod(RouteMethodEnum.bicycle);
                    onChangeItems(
                      items.indexOf(RouteMethodEnum.bicycle),
                    );
                  }
                },
                isSelected: method == RouteMethodEnum.bicycle,
              );
            }
            if (mapMethod == RouteMethodEnum.pedestrian) {
              return RouteMethodItem(
                key: Key(mapMethod.name),
                tip: 'Buscar DEA a pé',
                turns: method == RouteMethodEnum.pedestrian ? 1 : 0,
                icon: FontAwesomeIcons.personWalking,
                isSelected: method == RouteMethodEnum.pedestrian,
                onTap: () {
                  if (method != RouteMethodEnum.pedestrian) {
                    routeMethodCubit
                        .selectRouteMethod(RouteMethodEnum.pedestrian);
                    onChangeItems(
                      items.indexOf(RouteMethodEnum.pedestrian),
                    );
                  }
                },
              );
            }

            return const SizedBox.shrink();
          }).toList();

          return Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 8.0,
            spacing: 48.0,
            children: itemsWidget,
          );
        });
  }
}
