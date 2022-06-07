import 'package:google_maps_flutter/google_maps_flutter.dart';

class CalculatedRouteModel {
  CalculatedRouteModel({
    required this.id,
    required this.polyline,
    required this.routeDuration,
    required this.routeLength,
    this.convertedPolyline,
  });
  final String id;
  final int routeDuration;
  final int routeLength;
  final String polyline;
  final Set<Polyline>? convertedPolyline;

  CalculatedRouteModel copyWith({
    int? routeDuration,
    int? routeLength,
    String? polyline,
    Set<Polyline>? convertedPolyline,
  }) {
    return CalculatedRouteModel(
      id: id,
      routeDuration: routeDuration ?? this.routeDuration,
      routeLength: routeLength ?? this.routeLength,
      polyline: polyline ?? this.polyline,
      convertedPolyline: convertedPolyline ?? this.convertedPolyline,
    );
  }
}
