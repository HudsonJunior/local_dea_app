import 'package:dio/dio.dart';
import 'package:local_dea_app/resources/siga_api.dart';

class AuthLoginDataSource {
  const AuthLoginDataSource(this.api);

  final SigaApi api;

  Future<bool> login(Map<String, dynamic> data) async {
    try {
      final response = await api.dio.post('/mobile/login', data: data);
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioError catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}
