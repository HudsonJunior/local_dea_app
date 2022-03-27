import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/blocs/map/map.dart';
import 'package:local_dea_app/blocs/route_method_cubit.dart';
import 'package:local_dea_app/blocs/routing/routing.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/models/marker_model.dart';
import 'package:local_dea_app/widgets/custom_snackbar.dart';
import 'package:local_dea_app/widgets/loading_widget.dart';
import 'package:local_dea_app/widgets/map/custom_info_window.dart';
import 'package:local_dea_app/widgets/map/route_info_widget.dart';
import 'package:local_dea_app/widgets/retry_widget.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final MapCubit mapCubit;
  late final RoutingCubit routingCubit;
  late final RouteMethodCubit routeMethodCubit;
  late final GoogleMapController _controller;
  // final Location _location = Location()..enableBackgroundMode(enable: true);

  @override
  void initState() {
    super.initState();
    mapCubit = BlocProvider.of<MapCubit>(context)..validateLocationPermission();
    routingCubit = BlocProvider.of<RoutingCubit>(context);
    routeMethodCubit = BlocProvider.of<RouteMethodCubit>(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onCalculateRoute(MarkerModel marker) {
    routingCubit.loadRoute(
      destiny: marker.position,
      transport: routeMethodCubit.state,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapState>(
      listenWhen: (_, curr) =>
          curr is PermissionGrantedState || curr is LoadedDataState,
      listener: (context, state) async {
        if (state is PermissionGrantedState) {
          mapCubit.loadMapData();
        }
      },
      builder: (context, mapState) {
        if (mapState is LoadingInitialPositionState) {
          return const LoadingWidget();
        }
        if (mapState is LoadedDataState) {
          return BlocConsumer<RoutingCubit, RoutingState>(
            listenWhen: (_, curr) => curr is! LoadingRouteState,
            listener: (context, state) async {
              if (state is FailLoadedRouteState) {
                Navigator.of(context).pop();
                CustomSnackBar.show(
                  context,
                  'Falha ao calcular rota. Tente novamente',
                  success: false,
                );
              }
              if (state is LoadedRouteState) {
                _controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: mapState.coordenadas,
                      zoom: 20.0,
                    ),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            buildWhen: (_, state) => state is! LoadingRouteState,
            builder: (context, routeState) => Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: mapState.coordenadas,
                    zoom: 16,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                    // TODO: Corrigir camera que foca automaticamente. Só mover a camera quando
                    // algum caminho estiver sendo buscado.
                    // _location.onLocationChanged.listen(
                    //   (l) {
                    //     _controller.animateCamera(
                    //       CameraUpdate.newCameraPosition(
                    //         CameraPosition(
                    //           target: LatLng(
                    //             l.latitude ?? 0.0,
                    //             l.longitude ?? 0.0,
                    //           ),
                    //           zoom: 15,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  compassEnabled: true,
                  polylines: routeState is LoadedRouteState
                      ? routeState.model.convertedPolyline!
                      : {},
                  zoomControlsEnabled: false,
                  markers: mapState.markers.values
                      .map(
                        (marker) => Marker(
                          markerId: marker.id,
                          icon: marker.icon,
                          position: marker.position,
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: routeState is! LoadingRouteState,
                              backgroundColor: Palette.primary,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return EmergencyInfoWindow(
                                  model: marker.service,
                                  onCalculateRoute: () =>
                                      onCalculateRoute(marker),
                                );
                              },
                            );
                          },
                        ),
                      )
                      .toSet(),
                  myLocationEnabled: true,
                ),
                AnimatedCrossFade(
                  firstChild: RouteInfoWidget(
                    distance: routeState is LoadedRouteState
                        ? routeState.model.routeLength
                        : 0,
                    duration: routeState is LoadedRouteState
                        ? routeState.model.routeDuration ~/ 60
                        : 0,
                    onCleanRoute: () => routingCubit.cleanRoute(),
                  ),
                  secondChild: const SizedBox.shrink(),
                  crossFadeState: routeState is LoadedRouteState
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                ),
              ],
            ),
          );
        }

        if (mapState is FailToLoadInitialPosition) {
          return RetryWidget(
            message:
                'Não foi possível carregar a localização atual. Certifique-se de permitir acesso a localização.',
            onRetry: mapCubit.loadMapData,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
