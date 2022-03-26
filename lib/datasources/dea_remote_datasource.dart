import 'package:dio/dio.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/resources/search_api.dart';
import 'package:local_dea_app/resources/api_response.dart';

class DeaRemoteDatasource {
  final SearchApi api;

  DeaRemoteDatasource({
    required this.api,
  });

  final deaDataMock = [
    {
      'nome': 'Dea 1',
      'rua': 'Rua 1',
      'numero': 440,
      'bairro': 'Bairro 1',
      'inicio': null,
      'fim': null,
      'latitude': -23.409124,
      'longitude': -51.933593,
      'descricao': 'Descricao 1',
      'categoria': 0,
      'contato': '(44) 9 9695-4521',
      'isPrivado': false,
    },
    {
      'nome': 'Dea 2',
      'rua': 'Rua 2',
      'numero': 440,
      'bairro': 'Bairro 2',
      'inicio': null,
      'fim': null,
      'latitude': -23.411032,
      'longitude': -51.931899,
      'descricao': 'Descricao 2',
      'categoria': 1,
      'contato': '(44) 9 9695-4521',
      'isPrivado': false,
    },
    {
      'nome': 'DEA - Banco do Brasil',
      'rua': 'Rua Dez de Maio',
      'numero': 210,
      'bairro': 'Zona 07',
      'inicio': '08:00',
      'fim': '18:00',
      'latitude': -23.402880,
      'longitude': -51.933100,
      'descricao': 'DEA contido dentro do estabelecimento do Banco do Brasil',
      'categoria': 2,
      'contato': '(44) 9 9695-4521',
      'isPrivado': true,
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
