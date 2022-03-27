part of 'routing.dart';

abstract class RoutingState {}

class IdleRouteState extends RoutingState {}

class LoadingRouteState extends RoutingState {}

class LoadedRouteState extends RoutingState {
  LoadedRouteState({
    required this.model,
  });

  final CalculatedRouteModel model;
}

class FailLoadedRouteState extends RoutingState {}
