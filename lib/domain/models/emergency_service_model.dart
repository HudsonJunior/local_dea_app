import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_dea_app/domain/models/emergency_service_type.dart';

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
  final int? numero;
  final String? bairro;
  final String? horarioAbertura;
  final String? horarioFechamento;
  final double latitude;
  final double longitude;
  final String? descricao;
  final EmergencyServiceType categoria;
  final String? numContato;
  final bool isPrivado;

  static Iterable<EmergencyServiceModel> fromJsonListFirebase(
          List<QueryDocumentSnapshot<Map<String, dynamic>>> list) =>
      list.map(
        (service) => EmergencyServiceModel.fromJson(service.data()),
      );

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
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
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
      numero: map['numero']?.toInt(),
      bairro: map['bairro'] ?? '',
      horarioAbertura: map['inicio'] ?? '',
      horarioFechamento: map['fim'] ?? '',
      latitude: double.tryParse(map['latitude']) ?? 0.0,
      longitude: double.tryParse(map['longitude']) ?? 0.0,
      descricao: map['descricao'] ?? '',
      categoria: EmergencyServiceExt.fromInt((map['categoria'])),
      numContato: map['contato'] ?? '',
      isPrivado: map['isPrivado'] ?? false,
    );
  }
}
