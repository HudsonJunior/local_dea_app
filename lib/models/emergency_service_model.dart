import 'package:local_dea_app/models/emergency_service_type.dart';

class EmergencyServiceModel {
  EmergencyServiceModel({
    required this.nome,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.horarioAbertura,
    required this.horarioFechamento,
    required this.latitude,
    required this.longitude,
    required this.descricao,
    required this.categoria,
    required this.numContato,
    required this.isPrivado,
  });

  final String nome;
  final String rua;
  final int numero;
  final String? bairro;
  final String? horarioAbertura;
  final String? horarioFechamento;
  final double latitude;
  final double longitude;
  final String? descricao;
  final EmergencyServiceType categoria;
  final String? numContato;
  final bool isPrivado;

  static Iterable<EmergencyServiceModel> fromJsonList(List list) => list.map(
        (service) => EmergencyServiceModel.fromJson(service),
      );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'inicio': horarioAbertura,
      'fim': horarioFechamento,
      'latitude': latitude,
      'longitude': longitude,
      'descricao': descricao,
      'categoria': categoria.value,
      'contato': numContato,
      'isPrivado': isPrivado,
    };
  }

  factory EmergencyServiceModel.fromJson(dynamic map) {
    return EmergencyServiceModel(
      nome: map['nome'] ?? '',
      rua: map['rua'] ?? '',
      numero: map['numero']?.toInt() ?? 0,
      bairro: map['bairro'] ?? '',
      horarioAbertura: map['inicio'] ?? '',
      horarioFechamento: map['fim'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      descricao: map['descricao'] ?? '',
      categoria: EmergencyServiceExt.fromInt((map['categoria'])),
      numContato: map['contato'] ?? '',
      isPrivado: map['isPrivado'] ?? false,
    );
  }
}
