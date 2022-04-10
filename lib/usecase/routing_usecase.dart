import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/models/calculated_route_nodel.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';
import 'package:local_dea_app/models/matrix_calculating_model.dart';
import 'package:local_dea_app/models/route_method_model.dart';
import 'package:local_dea_app/models/routing_calculate_model.dart';
import 'package:local_dea_app/repositories/routing_repository.dart';
import 'package:local_dea_app/resources/polyline_decoder/flexible_polyline.dart';

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
        points: decodedPolyline,
        color: Palette.primary,
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

      final response = await routingRepository.calculateMatrix(
        MatrixCalculatingModel(
          origin: LatLng(currentLocation.latitude, currentLocation.longitude),
          destiny: models
              .where(
                (model) =>
                    model.categoria == EmergencyServiceType.dea ||
                    model.categoria == EmergencyServiceType.samu,
              )
              .map(
                (model) => {"lat": model.latitude, "lng": model.longitude},
              ),
          transport: transport,
        ),
      );

      if (response == null) return null;

      final minDistance = response.reduce(min);
      final minDistanceIndex =
          response.indexWhere((value) => value == minDistance);
      final minService = models.elementAt(minDistanceIndex);

      return LatLng(minService.latitude, minService.longitude);
    } catch (_) {
      return null;
    }
  }
}
