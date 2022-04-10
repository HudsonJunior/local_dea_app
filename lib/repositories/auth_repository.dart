import 'package:local_dea_app/datasources/auth_datasource.dart';
import 'package:local_dea_app/models/login_model.dart';

class AuthLoginRepository {
  AuthLoginRepository(this.dataSource);

  final AuthLoginDataSource dataSource;

  Future<bool> login(LoginModel loginModel) async {
    return await dataSource.login(loginModel.toMap());
  }
}
