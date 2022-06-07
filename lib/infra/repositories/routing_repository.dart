import 'package:local_dea_app/domain/models/calculated_route_nodel.dart';
import 'package:local_dea_app/domain/models/matrix_calculating_model.dart';
import 'package:local_dea_app/domain/models/routing_calculate_model.dart';
import 'package:local_dea_app/infra/datasources/routing_remote_datasource.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';

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

  Future<List<int>?> calculateMatrix(
    MatrixCalculatingModel model,
  ) async {
    final response = await routingRemoteDatasource.calculateMatrix(model);

    if (response is SuccessApiResponse<List<int>>) {
      return response.data;
    }

    return null;
  }
}
