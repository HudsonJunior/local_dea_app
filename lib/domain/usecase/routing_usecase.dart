import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/domain/models/calculated_route_nodel.dart';
import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/domain/models/matrix_calculating_model.dart';
import 'package:local_dea_app/domain/models/route_method_model.dart';
import 'package:local_dea_app/domain/models/routing_calculate_model.dart';
import 'package:local_dea_app/infra/repositories/routing_repository.dart';
import 'package:local_dea_app/infra/resources/polyline_decoder/flexible_polyline.dart';

class RoutingUseCase {
  RoutingUseCase(this.routingRepository);

  final RoutingRepository routingRepository;

  Future<CalculatedRouteModel?> calculateRoute({
    required LatLng destiny,
    required RouteMethodEnum transport,
  }) async {
    try {
      final currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      final model = RoutingCalculateModel(
        origin: LatLng(currentLocation.latitude, currentLocation.longitude),
        destiny: destiny,
        transport: transport,
      );

      final response = await routingRepository.calculateRoute(model);

      if (response == null) {
        return null;
      }

      final decodedPolyline = FlexiblePolyline.decode(response.polyline);
      final polyline = Polyline(
        polylineId: PolylineId(response.id),
        points: decodedPolyline.map((e) => LatLng(e.lat, e.lng)).toList(),
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        color: Palette.redGradient2,
        width: 8,
      );

      return response.copyWith(convertedPolyline: {polyline});
    } catch (_) {
      return null;
    }
  }

  Future<LatLng?> calculateMatrix({
    required Iterable<EmergencyServiceModel> models,
    required RouteMethodEnum transport,
  }) async {
    try {
      final currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      final destinyModels = models.map(
        (model) => {"lat": model.latitude, "lng": model.longitude},
      );

      final response = await routingRepository.calculateMatrix(
        MatrixCalculatingModel(
          origin: LatLng(currentLocation.latitude, currentLocation.longitude),
          destiny: destinyModels,
          transport: transport,
        ),
      );

      if (response == null) return null;

      final minDistance = response.reduce(min);

      final minDistanceIndex = response.indexOf(minDistance);

      final minService = destinyModels.elementAt(minDistanceIndex);

      return LatLng(minService['lat']!, minService['lng']!);
    } catch (_) {
      return null;
    }
  }
}
