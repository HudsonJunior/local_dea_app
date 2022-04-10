import 'package:local_dea_app/models/login_model.dart';
import 'package:local_dea_app/repositories/auth_repository.dart';

class AuthLoginUseCase {
  const AuthLoginUseCase(this.authLoginRepository);

  final AuthLoginRepository authLoginRepository;

  Future<bool> login(LoginModel loginModel) async {
    return await authLoginRepository.login(loginModel);
  }
}
