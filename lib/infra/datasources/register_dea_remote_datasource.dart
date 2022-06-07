import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/infra/resources/api_response.dart';
import 'package:local_dea_app/infra/resources/siga_api.dart';

class RegisterDeaRemoteDatasource {
  final SigaApi api;

  RegisterDeaRemoteDatasource({
    required this.api,
  });

  Future<ApiResponse> registerDea(
    EmergencyServiceModel model,
  ) async {
    try {
      // TODO finalizar
      return SuccessApiResponse(data: null);

      await api.dio.post(
        '/mobile/local_dea',
        data: model.toJson(),
      );

      return SuccessApiResponse(data: null);
    } catch (_) {
      return FailApiResponse(
        error: 'Não foi possível cadastrar o DEA.',
      );
    }
  }
}
