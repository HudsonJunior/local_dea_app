import 'package:local_dea_app/datasources/register_dea_remote_datasource.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/resources/api_response.dart';

class RegisterDeaRepository {
  final RegisterDeaRemoteDatasource registerDeaRemoteDatasource;

  RegisterDeaRepository({
    required this.registerDeaRemoteDatasource,
  });

  Future<bool> registerDea(EmergencyServiceModel model) async {
    final response = await registerDeaRemoteDatasource.registerDea(
      model,
    );

    if (response is SuccessApiResponse) {
      return true;
    }

    return false;
  }
}
