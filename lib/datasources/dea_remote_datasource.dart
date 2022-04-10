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
      'nome': 'DEA - Shopping Maringá Park',
      'rua': 'Av. São Paulo',
      'numero': 1099,
      'bairro': 'Zona 01',
      'inicio': '10:00',
      'fim': '22:00',
      'latitude': -23.422116624960143,
      'longitude': -51.93265621811691,
      'descricao': 'Ambulatório do Shopping com enfermeiras.',
      'categoria': 0,
      'contato': '(44) 3366-2000',
      'isPrivado': false,
    },
    {
      'nome': 'DEA - Shopping Avenida Center',
      'rua': 'Av. São Paulo',
      'numero': 743,
      'bairro': 'Centro',
      'inicio': '10:00',
      'fim': '22:00',
      'latitude': -23.418992889550932,
      'longitude': -51.9320752386371,
      'descricao': 'Localizado com os bombeiros do shopping.',
      'categoria': 0,
      'contato': '(44) 3033-7000',
      'isPrivado': false,
    },
    {
      'nome': 'DEA - Shopping Cidade',
      'rua': 'Av. Tuiuti',
      'numero': 710,
      'bairro': 'Vila Nova',
      'inicio': '10:00',
      'fim': '22:00',
      'latitude': -23.421747832101264,
      'longitude': -51.90656818465927,
      'descricao': 'Localizado com os bombeiros do shopping.',
      'categoria': 0,
      'contato': '(44) 2103-1100',
      'isPrivado': false,
    },
    {
      'nome': 'DEA - Supermercado Angeloni',
      'rua': 'Av. Advogado Horácio Raccanello Filho',
      'numero': 5120,
      'bairro': 'Novo Centro',
      'inicio': '10:00',
      'fim': '22:00',
      'latitude': -23.417639085381744,
      'longitude': -51.93101555847202,
      'descricao': 'Localizado com os brigadistas do supermercado.',
      'categoria': 0,
      'contato': '(44) 3301-3600',
      'isPrivado': false,
    },
    {
      'nome': 'DEA - Clube Olímpico',
      'rua': 'Av. Colombo',
      'numero': 10602,
      'bairro': 'Jardim Olímpico',
      'inicio': '07:00',
      'fim': '22:00',
      'latitude': -23.414849,
      'longitude': -51.979432,
      'descricao': '',
      'categoria': 0,
      'contato': '(44) 3224-3261',
      'isPrivado': false,
    },
    {
      'nome': 'Hospital Bom Samaritano',
      'rua': 'Av. Independência',
      'numero': 93,
      'bairro': 'Zona 04',
      'latitude': -23.423241508080935,
      'longitude': -51.95278205397782,
      'descricao': 'Referência hemodinâmica para PCR.',
      'categoria': 1,
      'contato': '(44) 3032-1818',
      'isPrivado': false,
    },
    {
      'nome': 'Hospital Santa Rita',
      'rua': 'Av. Rio Branco',
      'numero': 101,
      'bairro': 'Zona 04',
      'latitude': -23.42544678362103,
      'longitude': -51.94991048465927,
      'descricao': 'Referência hemodinâmica para PCR.',
      'categoria': 1,
      'contato': '(44) 3220-6000',
      'isPrivado': false,
    },
    {
      'nome': 'UPA Zona Sul',
      'rua': 'Av. Arquiteto Nildo Ribeiro da Rocha',
      'numero': 865,
      'bairro': 'Jardim Higienópolis',
      'latitude': -23.45187865244782,
      'longitude': -51.92413515511317,
      'descricao': 'Atendimento Pré-Hospitalar.',
      'categoria': 3,
      'contato': '(44) 3221-4812',
      'isPrivado': false,
    },
    {
      'nome': 'UPA Zona Norte',
      'rua': 'Rua Ana Neri',
      'numero': 1073,
      'bairro': 'Jardim Alvorada Higienópolis',
      'latitude': -23.39667219117495,
      'longitude': -51.913220643466424,
      'descricao': 'Atendimento Pré-Hospitalar.',
      'categoria': 3,
      'contato': '(44) 3261-7921',
      'isPrivado': false,
    },
    {
      'nome': 'SAMU - BASE CENTRAL',
      'rua': 'Rua Benjamin Constant',
      'numero': 93,
      'bairro': 'Zona 07',
      'latitude': -23.41688861038051,
      'longitude': -51.9439217468239,
      'descricao': 'Estação do SAMU.',
      'categoria': 2,
      'contato': '(44) 3218-6150',
      'isPrivado': false,
    },
    {
      'nome': 'SAMU - BASE NORTE',
      'rua': 'Rua Ana Neri',
      'numero': 95,
      'bairro': 'Jardim Alvorada',
      'latitude': -23.396856779984923,
      'longitude': -51.912576751395925,
      'descricao': 'Estação do SAMU.',
      'categoria': 2,
      'contato': null,
      'isPrivado': false,
    },
    {
      'nome': 'SAMU - BASE SUL',
      'rua': 'Rua Pioneiro Antônio Paulo da Silva',
      'numero': null,
      'bairro': 'Parque da Gavea',
      'latitude': -23.451700201213956,
      'longitude': -51.92441835397782,
      'descricao': 'Estação do SAMU.',
      'categoria': 2,
      'contato': '(44) 3218-6250',
      'isPrivado': false,
    },
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
