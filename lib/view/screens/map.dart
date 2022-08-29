import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/view/blocs/map/map.dart';
import 'package:local_dea_app/view/blocs/route_method_cubit.dart';
import 'package:local_dea_app/view/blocs/routing/routing.dart';
import 'package:local_dea_app/view/screens/menu.dart';
import 'package:local_dea_app/view/widgets/map/emergency_fab.dart';
import 'package:local_dea_app/view/widgets/map/map_widget.dart';
import 'package:local_dea_app/view/widgets/route_method.dart';
import 'package:local_dea_app/view/widgets/search_dea_button.dart';

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
        endDrawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Palette.redGradient1, Palette.redGradient2],
              ),
            ),
            child: const MenuWidget(),
          ),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.redAccent, Colors.red],
              ),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/dea_icon.png',
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 8.0),
              const Text(
                'Local DEA',
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            const MapWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Flexible(child: RouteMethodWidget()),
                  const SizedBox(height: 16),
                  BlocBuilder<RoutingCubit, RoutingState>(
                    bloc: routingCubit,
                    builder: (context, state) {
                      return Flexible(
                        child: LocalDeaButton(
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
                          icon: Icons.search_outlined,
                          isLoading: state is LoadingRouteState,
                        ),
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
