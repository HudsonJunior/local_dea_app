import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';

class MarkerModel {
  final MarkerId id;
  final BitmapDescriptor icon;
  final LatLng position;
  final EmergencyServiceModel service;

  MarkerModel({
    required this.id,
    required this.icon,
    required this.position,
    required this.service,
  });
}
