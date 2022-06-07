import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/domain/models/marker_model.dart';

class EmergencyServiceMarker {
  EmergencyServiceMarker({
    required this.models,
    required this.markers,
  });

  final Map<String, EmergencyServiceModel> models;
  final Map<String, MarkerModel> markers;
}
