import 'package:bloc/bloc.dart';
import 'package:local_dea_app/models/route_method_model.dart';

class RouteMethodCubit extends Cubit<RouteMethodEnum> {
  RouteMethodCubit() : super(RouteMethodEnum.pedestrian);

  selectRouteMethod(RouteMethodEnum method) {
    emit(method);
  }
}
