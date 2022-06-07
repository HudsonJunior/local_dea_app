import 'package:local_dea_app/domain/models/login_model.dart';
import 'package:local_dea_app/infra/datasources/auth/auth_remote_datasource.dart';

class AuthLoginRepository {
  AuthLoginRepository(this.dataSource);

  final AuthLoginRemoteDataSource dataSource;

  Future<bool> login(LoginModel loginModel) async {
    return await dataSource.login(loginModel.toMap());
  }
}
