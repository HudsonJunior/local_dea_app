import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/resources/api_response.dart';
import 'package:local_dea_app/resources/siga_api.dart';

class RegisterDeaRemoteDatasource {
  final SigaApi api;

  RegisterDeaRemoteDatasource({
    required this.api,
  });

  Future<ApiResponse> registerDea(
    EmergencyServiceModel model,
  ) async {
    try {
      await api.dio.post(
        '/mobile/local_dea',
        data: model.toJson(),
      );

      return SuccessApiResponse(data: null);
    } catch (error) {
      return FailApiResponse(
        error: 'Não foi possível cadastrar o DEA.',
      );
    }
  }
}
