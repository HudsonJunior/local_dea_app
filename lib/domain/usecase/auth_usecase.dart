import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:local_dea_app/domain/models/login_model.dart';
import 'package:local_dea_app/infra/repositories/auth_repository.dart';

class AuthLoginUseCase {
  final String _salt = "\$2a\$10\$gKl9XYETbNl1bb5L4w6WS.";

  const AuthLoginUseCase(this.authLoginRepository);

  final AuthLoginRepository authLoginRepository;

  Future<bool> login(LoginModel loginModel) async {
    try {
      final hash = await FlutterBcrypt.hashPw(
          password: loginModel.password, salt: _salt);

      return await authLoginRepository.login(
        LoginModel.withHash(loginModel, hash),
      );
    } catch (_) {
      return false;
    }
  }
}
