import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/domain/models/marker_model.dart';
import 'package:local_dea_app/domain/usecase/map_usecase.dart';
import 'package:local_dea_app/infra/datasources/dea_remote_datasource.dart';
import 'package:local_dea_app/infra/repositories/dea_repository.dart';
import 'package:local_dea_app/infra/resources/siga_api.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitialMapState());

  final mapUseCase = MapUseCase(
    deaRepository: DeaRepository(
      deaRemoteDatasource: DeaRemoteDatasource(api: SigaApi.instance),
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

  void updateCurrentPosition() async {
    if (state is! LoadedDataState) return;

    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      final stateAux = (state as LoadedDataState);
      emit(
        LoadedDataState(
          coordenadas: LatLng(
            currentPosition.latitude,
            currentPosition.longitude,
          ),
          markers: stateAux.markers,
          models: stateAux.models,
        ),
      );
    } catch (_) {
      return;
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
