import 'package:dio/dio.dart';

class MatrixApi {
  MatrixApi._();

  static final _instance = MatrixApi._();

  static MatrixApi get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://matrix.router.hereapi.com/v8/matrix',
      connectTimeout: 10000,
      receiveTimeout: 90000,
    ),
  );
}
