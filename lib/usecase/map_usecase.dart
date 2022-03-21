import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/emergency_service_marker.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';
import 'package:local_dea_app/repositories/dea_repository.dart';

class MapUseCase {
  final DeaRepository deaRepository;

  MapUseCase({
    required this.deaRepository,
  });

  Future<LatLng?> loadInitialPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
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
        const ImageConfiguration(),
        'assets/dea_icon_marker.png',
      );

      final deas = await deaRepository.getDeas();

      if (deas.isEmpty) return null;

      final serviceModels = <String, EmergencyServiceModel>{};
      final serviceMarkers = <String, Marker>{};

      for (var dea in deas) {
        final id = dea.nome + dea.hashCode.toString() + (dea.descricao ?? '');
        serviceModels[id] = dea;
        serviceMarkers[id] = Marker(
          markerId: MarkerId(dea.nome + (dea.descricao ?? '')),
          icon: dea.categoria == EmergencyServiceType.dea
              ? deaIcon
              : dea.categoria == EmergencyServiceType.hospital
                  ? hospitalIcon
                  : samuIcon,
          position: LatLng(dea.latitude, dea.longitude),
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
