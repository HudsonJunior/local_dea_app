import 'package:local_dea_app/models/calculated_route_nodel.dart';
import 'package:local_dea_app/models/routing_calculate_model.dart';
import 'package:local_dea_app/resources/api_response.dart';
import 'package:local_dea_app/resources/route_api.dart';

class RoutingRemoteDatasource {
  final RouteApi api;

  RoutingRemoteDatasource({
    required this.api,
  });

  Future<ApiResponse<CalculatedRouteModel>> calculateRote(
    RoutingCalculateModel model,
  ) async {
    try {
      final response = await api.dio.get(
        '',
        queryParameters: {
          'apiKey': 'OsnlH0CA8kKzeK-087EU71JPE5_mG9bmI5umkNVaWLQ',
          'transportMode': model.transport.name,
          'origin': '${model.origin.latitude},${model.origin.longitude}',
          'destination': '${model.destiny.latitude},${model.destiny.longitude}',
          'return': 'summary,polyline'
        },
      );

      final sections = response.data['routes'][0]['sections'];

      if (sections != null) {
        final data = CalculatedRouteModel(
          polyline: sections[0]['polyline'],
          routeDuration: sections[0]['summary']['duration'],
          routeLength: sections[0]['summary']['length'],
          id: sections[0]['id'],
        );

        return SuccessApiResponse(data: data);
      }

      return FailApiResponse(
        error: 'Não foi possível obter a localização especificada.',
      );
    } catch (error) {
      return FailApiResponse(
        error: 'Não foi possível obter a localização especificada.',
      );
    }
  }
}
