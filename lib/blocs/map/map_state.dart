part of 'map.dart';

abstract class MapState {}

class LoadingInitialPositionState extends MapState {}

class InitialMapState extends MapState {}

class LoadedDataState extends MapState {
  final LatLng coordenadas;
  final Map<String, MarkerModel> markers;
  final Map<String, EmergencyServiceModel> models;

  LoadedDataState({
    required this.coordenadas,
    required this.markers,
    required this.models,
  });
}

class FailToLoadInitialPosition extends MapState {}

class PermissionGrantedState extends MapState {}

class PermissionDeniedState extends MapState {}
