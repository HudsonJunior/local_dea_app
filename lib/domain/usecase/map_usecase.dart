import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/domain/models/emergency_service_marker.dart';
import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/domain/models/emergency_service_type.dart';
import 'package:local_dea_app/domain/models/marker_model.dart';
import 'package:local_dea_app/infra/repositories/dea_repository.dart';

class MapUseCase {
  final DeaRepository deaRepository;

  MapUseCase({
    required this.deaRepository,
  });

  Future<LatLng?> loadInitialPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      return LatLng(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      return null;
    }
  }

  Future<EmergencyServiceMarker?> loadData() async {
    try {
      final hospitalIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/edificio-hospitalar.png',
      );
      final samuIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/samu_icon.png',
      );
      final deaIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)),
        'assets/dea_icon_marker.png',
      );

      final deas = await deaRepository.getDeas();

      if (deas.isEmpty) return null;

      final serviceModels = <String, EmergencyServiceModel>{};
      final serviceMarkers = <String, MarkerModel>{};

      for (var dea in deas) {
        final id = dea.nome + dea.hashCode.toString() + (dea.descricao ?? '');
        serviceModels[id] = dea;
        serviceMarkers[id] = MarkerModel(
          icon: dea.categoria == EmergencyServiceType.dea
              ? deaIcon
              : dea.categoria == EmergencyServiceType.hospital
                  ? hospitalIcon
                  : samuIcon,
          id: MarkerId(
            dea.nome + (dea.descricao ?? ''),
          ),
          position: LatLng(dea.latitude, dea.longitude),
          service: dea,
        );
      }

      return EmergencyServiceMarker(
        models: serviceModels,
        markers: serviceMarkers,
      );
    } catch (e) {
      return null;
    }
  }
}
