import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';

class EmergencyServiceMarker {
  EmergencyServiceMarker({
    required this.models,
    required this.markers,
  });

  final Map<String, EmergencyServiceModel> models;
  final Map<String, Marker> markers;
}
