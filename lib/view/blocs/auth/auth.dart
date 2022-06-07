import 'package:bloc/bloc.dart';
import 'package:local_dea_app/domain/models/login_model.dart';
import 'package:local_dea_app/domain/usecase/auth_usecase.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthFailedState extends AuthState {}

class AuthSucceedState extends AuthState {}

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final LoginModel loginModel;

  AuthLoginEvent({
    required this.loginModel,
  });
}

class AuthLogoutEvent extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.useCase) : super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }

  final AuthLoginUseCase useCase;

  Future<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    final response = await useCase.login(event.loginModel);

    if (!response) {
      return emit(AuthFailedState());
    }

    emit(AuthSucceedState());
  }

  Future<void> _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitialState());
  }
}
