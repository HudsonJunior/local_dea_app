import 'package:dio/dio.dart';
import 'package:local_dea_app/resources/siga_api.dart';

class AuthLoginDataSource {
  const AuthLoginDataSource(this.api);

  final SigaApi api;

  Future<bool> login(Map<String, dynamic> data) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return true;
      final response = await api.dio.post('/login', data: data);
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
