import 'package:dio/dio.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/resources/api.dart';
import 'package:local_dea_app/resources/api_response.dart';

class DeaRemoteDatasource {
  final Api api;

  DeaRemoteDatasource({
    required this.api,
  });

  final deaDataMock = [
    {
      'nome': 'Dea 1',
      'rua': 'Rua 1',
      'numero': 440,
      'bairro': 'Bairro 1',
      'horarioAbertura': null,
      'horarioFechamento': null,
      'latitude': -23.409124,
      'longitude': -51.933593,
      'descricao': 'Descricao 1',
      'categoria': 0,
      'numContato': '44 996954511',
      'isPrivado': false,
    },
    {
      'nome': 'Dea 2',
      'rua': 'Rua 2',
      'numero': 440,
      'bairro': 'Bairro 2',
      'horarioAbertura': null,
      'horarioFechamento': null,
      'latitude': -23.411032,
      'longitude': -51.931899,
      'descricao': 'Descricao 2',
      'categoria': 1,
      'numContato': '44 996954521',
      'isPrivado': false,
    },
    {
      'nome': 'Dea 3',
      'rua': 'Rua 3',
      'numero': 440,
      'bairro': 'Bairro 3',
      'horarioAbertura': null,
      'horarioFechamento': null,
      'latitude': -23.402880,
      'longitude': -51.933100,
      'descricao': 'Descricao 3',
      'categoria': 2,
      'numContato': '44 996954533',
      'isPrivado': false,
    }
  ];

  Future<ApiResponse<Iterable<EmergencyServiceModel>>> getDeas() async {
    try {
      // final response = await _dio.get('mobile/local_dea');
      // final data = response.data;

      return SuccessApiResponse(
        data: EmergencyServiceModel.fromJsonList(deaDataMock),
      );
    } on DioError catch (error) {
      return FailApiResponse(error: error.message);
    }
  }

  Future<ApiResponse<bool>> createDea(EmergencyServiceModel model) async {
    try {
      await api.dio.post(
        'mobile/local_dea',
        data: model.toJson(),
      );

      return SuccessApiResponse(data: true);
    } on DioError catch (error) {
      return FailApiResponse(error: error.message);
    }
  }
}
