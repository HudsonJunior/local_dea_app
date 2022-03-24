import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/blocs/map/map.dart';
import 'package:local_dea_app/widgets/loading_widget.dart';
import 'package:local_dea_app/widgets/retry_widget.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final MapCubit mapCubit;

  @override
  void initState() {
    super.initState();
    mapCubit = BlocProvider.of<MapCubit>(context)..validateLocationPermission();
  }

  late final GoogleMapController _controller;
  // final Location _location = Location()..enableBackgroundMode(enable: true);

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
      builder: (context, state) {
        if (state is LoadingInitialPositionState) {
          return const LoadingWidget();
        }
        if (state is LoadedDataState) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: state.coordenadas,
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
            zoomControlsEnabled: false,
            markers: state.markers.values.toSet(),
            myLocationEnabled: true,
          );
        }

        if (state is FailToLoadInitialPosition) {
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
