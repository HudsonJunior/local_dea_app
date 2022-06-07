part of 'register_dea.dart';

abstract class RegisterDeaState {}

class RegisterDeaLoadingState extends RegisterDeaState {}

class RegisterDeaIdleState extends RegisterDeaState {}

class RegisterDeaFailState extends RegisterDeaState {}

class RegisterDeaSuccessState extends RegisterDeaState {}
