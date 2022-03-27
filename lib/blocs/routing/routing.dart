import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_dea_app/models/calculated_route_nodel.dart';
import 'package:local_dea_app/models/route_method_model.dart';
import 'package:local_dea_app/usecase/routing_usecase.dart';

part 'routing_state.dart';

class RoutingCubit extends Cubit<RoutingState> {
  RoutingCubit(
    this.routingUseCase,
  ) : super(IdleRouteState());

  final RoutingUseCase routingUseCase;

  void loadRoute({
    required LatLng destiny,
    required RouteMethodEnum transport,
  }) async {
    try {
      emit(LoadingRouteState());

      final response = await routingUseCase.calculateRoute(
        destiny: destiny,
        transport: transport,
      );

      if (response == null) {
        return emit(FailLoadedRouteState());
      }

      return emit(LoadedRouteState(model: response));
    } catch (_) {
      return emit(FailLoadedRouteState());
    }
  }

  void cleanRoute() {
    emit(IdleRouteState());
  }
}
