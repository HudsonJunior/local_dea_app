import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/datasources/dea_remote_datasource.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/repositories/dea_repository.dart';
import 'package:local_dea_app/resources/search_api.dart';
import 'package:local_dea_app/usecase/map_usecase.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitialMapState());

  final mapUseCase = MapUseCase(
    deaRepository: DeaRepository(
      deaRemoteDatasource: DeaRemoteDatasource(api: SearchApi.instance),
    ),
  );

  void validateLocationPermission() async {
    final permission = await Geolocator.checkPermission();

    if (permission != LocationPermission.deniedForever &&
        permission != LocationPermission.denied) {
      return emit(PermissionGrantedState());
    }

    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return emit(PermissionDeniedState());
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return emit(PermissionGrantedState());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return emit(PermissionDeniedState());
    }
  }

  void loadMapData() async {
    emit(LoadingInitialPositionState());

    final coordenadas = await mapUseCase.loadInitialPosition();

    if (coordenadas == null) {
      emit(FailToLoadInitialPosition());
      return;
    }

    final data = await mapUseCase.loadData();

    if (data == null) {
      return emit(FailToLoadInitialPosition());
    }

    emit(
      LoadedDataState(
        coordenadas: coordenadas,
        markers: data.markers,
        models: data.models,
      ),
    );
  }
}
