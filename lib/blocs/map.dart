import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/usecase/map_usecase.dart';

abstract class MapState {}

class LoadingInitialPositionState extends MapState {}

class InitialMapState extends MapState {}

class LoadedDataState extends MapState {
  final LatLng coordenadas;
  final Map<String, Marker> markers;

  LoadedDataState({
    required this.coordenadas,
    required this.markers,
  });
}

class FailToLoadInitialPosition extends MapState {}

class PermissionGrantedState extends MapState {}

class PermissionDeniedState extends MapState {}

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitialMapState());

  final mapUseCase = MapUseCase();

  void validateLocationPermission() async {
    final permission = await Geolocator.checkPermission();

    if (permission != LocationPermission.deniedForever &&
        permission != LocationPermission.denied) {
      emit(PermissionGrantedState());
      return;
    }

    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(PermissionDeniedState());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(PermissionDeniedState());
    }
  }

  void loadMapData() async {
    emit(LoadingInitialPositionState());

    final coordenadas = await mapUseCase.loadInitialPosition();

    if (coordenadas == null) {
      emit(FailToLoadInitialPosition());
      return;
    }

    final markers = await mapUseCase.loadMarkers(coordenadas);

    emit(
      LoadedDataState(
        coordenadas: coordenadas,
        markers: markers!,
      ),
    );
  }
}
