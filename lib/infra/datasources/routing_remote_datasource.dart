import 'package:local_dea_app/domain/models/calculated_route_nodel.dart';
import 'package:local_dea_app/domain/models/matrix_calculating_model.dart';
import 'package:local_dea_app/domain/models/route_method_model.dart';
import 'package:local_dea_app/domain/models/routing_calculate_model.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';
import 'package:local_dea_app/infra/resources/matrix_api.dart';
import 'package:local_dea_app/infra/resources/route_api.dart';

class RoutingRemoteDatasource {
  final RouteApi routingApi;
  final MatrixApi matrixApi;

  RoutingRemoteDatasource({
    required this.routingApi,
    required this.matrixApi,
  });

  Future<ApiResponse<CalculatedRouteModel>> calculateRote(
    RoutingCalculateModel model,
  ) async {
    try {
      final response = await routingApi.dio.get(
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

  Future<ApiResponse<List<int>>> calculateMatrix(
    MatrixCalculatingModel model,
  ) async {
    try {
      final response = await matrixApi.dio.post(
        '',
        data: {
          "origins": [
            {"lat": model.origin.latitude, "lng": model.origin.longitude}
          ],
          "destinations": model.destiny.toList(),
          "regionDefinition": {"type": "world"},
          "profile": model.transport == RouteMethodEnum.car
              ? "carFast"
              : model.transport.name,
          "matrixAttributes": ["distances", "travelTimes"],
        },
        queryParameters: {
          "async": false,
          'apiKey': 'OsnlH0CA8kKzeK-087EU71JPE5_mG9bmI5umkNVaWLQ',
        },
      );
      final results = response.data["matrix"]["distances"];

      if (results != null && results.length > 0) {
        return SuccessApiResponse(data: List<int>.from(results));
      }
      return FailApiResponse(error: 'Não foi possível calcular a menor rota.');
    } catch (_) {
      return FailApiResponse(error: 'Não foi possível calcular a menor rota.');
    }
  }
}
