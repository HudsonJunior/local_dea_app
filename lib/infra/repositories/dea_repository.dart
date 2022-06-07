import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/infra/datasources/dea_remote_datasource.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';

class DeaRepository {
  final DeaRemoteDatasource deaRemoteDatasource;

  DeaRepository({
    required this.deaRemoteDatasource,
  });

  Future<Iterable<EmergencyServiceModel>> getDeas() async {
    final response = await deaRemoteDatasource.getDeas();

    if (response is SuccessApiResponse<Iterable<EmergencyServiceModel>>) {
      return response.data;
    }

    return [];
  }
}
