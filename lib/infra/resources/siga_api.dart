import 'package:dio/dio.dart';

class SigaApi {
  SigaApi._();

  static final _instance = SigaApi._();

  static SigaApi get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://samu.uem.br/siga',
      connectTimeout: 10000,
      receiveTimeout: 90000,
    ),
  );
}
