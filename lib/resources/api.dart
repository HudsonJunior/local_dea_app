import 'package:dio/dio.dart';

class Api {
  Api._();

  static final _instance = Api._();

  static Api get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );
}
