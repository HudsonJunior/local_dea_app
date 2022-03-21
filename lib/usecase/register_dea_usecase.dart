import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/emergency_service_model.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';
import 'package:local_dea_app/repositories/register_dea_repository.dart';

class RegisterDeaUseCase {
  RegisterDeaUseCase(this.registerDeaRepository);

  final RegisterDeaRepository registerDeaRepository;

  Future<bool> registerDea({
    required String street,
    required String houseNumber,
    required String serviceName,
    required EmergencyServiceType serviceType,
    required bool privateService,
    String? complement,
    String? contactNumber,
    String? description,
    String? openHour,
    String? endHour,
    required LatLng coordinates,
  }) async {
    final model = EmergencyServiceModel(
      nome: serviceName,
      rua: street,
      numero: int.parse(houseNumber),
      bairro: complement,
      horarioAbertura: openHour,
      horarioFechamento: endHour,
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
      descricao: description,
      categoria: serviceType,
      numContato: contactNumber,
      isPrivado: privateService,
    );

    return registerDeaRepository.registerDea(model);
  }
}
