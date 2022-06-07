import 'package:bloc/bloc.dart';
import 'package:local_dea_app/domain/models/emergency_service_type.dart';
import 'package:local_dea_app/domain/usecase/discover_place_usecase.dart';
import 'package:local_dea_app/domain/usecase/register_dea_usecase.dart';

part 'register_dea_state.dart';

class RegisterDeaCubit extends Cubit<RegisterDeaState> {
  RegisterDeaCubit(
    this.discoverPlaceUsecase,
    this.registerDeaUsecase,
  ) : super(RegisterDeaIdleState());

  final DiscoverPlaceUsecase discoverPlaceUsecase;
  final RegisterDeaUseCase registerDeaUsecase;

  void registerDea({
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
  }) async {
    emit(RegisterDeaLoadingState());

    final coordinates = await discoverPlaceUsecase.discoverPlaceCoordinate(
      street: street,
      houseNumber: houseNumber,
    );

    if (coordinates == null) {
      return emit(RegisterDeaFailState());
    }

    final response = await registerDeaUsecase.registerDea(
      street: street,
      houseNumber: houseNumber,
      serviceName: serviceName,
      serviceType: serviceType,
      privateService: privateService,
      coordinates: coordinates,
      complement: complement,
      contactNumber: contactNumber,
      description: description,
      openHour: openHour,
      endHour: endHour,
    );

    if (response) {
      return emit(RegisterDeaSuccessState());
    }

    return emit(RegisterDeaFailState());
  }
}
