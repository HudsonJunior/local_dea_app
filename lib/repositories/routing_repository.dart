import 'package:local_dea_app/datasources/routing_remote_datasource.dart';
import 'package:local_dea_app/models/calculated_route_nodel.dart';
import 'package:local_dea_app/models/routing_calculate_model.dart';
import 'package:local_dea_app/resources/api_response.dart';

class RoutingRepository {
  final RoutingRemoteDatasource routingRemoteDatasource;

  RoutingRepository({
    required this.routingRemoteDatasource,
  });

  Future<CalculatedRouteModel?> calculateRoute(
      RoutingCalculateModel model) async {
    final response = await routingRemoteDatasource.calculateRote(model);

    if (response is SuccessApiResponse<CalculatedRouteModel>) {
      return response.data;
    }

    return null;
  }
}
