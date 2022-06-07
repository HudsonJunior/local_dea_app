import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/domain/models/route_method_model.dart';

class RoutingCalculateModel {
  RoutingCalculateModel({
    required this.origin,
    required this.destiny,
    required this.transport,
  });

  final LatLng destiny;
  final LatLng origin;
  final RouteMethodEnum transport;
}
