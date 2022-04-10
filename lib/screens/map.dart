import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/blocs/map/map.dart';
import 'package:local_dea_app/blocs/route_method_cubit.dart';
import 'package:local_dea_app/blocs/routing/routing.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/screens/menu.dart';
import 'package:local_dea_app/widgets/map/emergency_fab.dart';
import 'package:local_dea_app/widgets/map/map_widget.dart';
import 'package:local_dea_app/widgets/route_method.dart';
import 'package:local_dea_app/widgets/search_dea_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  late final RoutingCubit routingCubit;
  late final RouteMethodCubit routeMethodCubit;
  late final MapCubit mapCubit;

  @override
  void initState() {
    super.initState();
    routingCubit = BlocProvider.of<RoutingCubit>(context);
    routeMethodCubit = BlocProvider.of<RouteMethodCubit>(context);
    mapCubit = BlocProvider.of<MapCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primary,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/dea_icon.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8.0),
              const Text(
                'Local DEA',
              ),
            ],
          ),
          actions: [
            Flexible(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.menu,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
          ],
        ),
        body: Stack(
          children: [
            const MapWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const RouteMethodWidget(),
                  const SizedBox(height: 18.0),
                  BlocBuilder<RoutingCubit, RoutingState>(
                    bloc: routingCubit,
                    builder: (context, state) {
                      return SearchDeaButton(
                        onPress: () {
                          routingCubit.loadMatrixRoute(
                            models: mapCubit.state is LoadedDataState
                                ? (mapCubit.state as LoadedDataState)
                                    .models
                                    .values
                                : [],
                            transport: routeMethodCubit.state,
                          );
                        },
                        icon: Icons.location_pin,
                        isLoading: state is LoadingRouteState,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const EmergencyFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
