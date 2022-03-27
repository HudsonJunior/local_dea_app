import 'package:dio/dio.dart';

class RouteApi {
  RouteApi._();

  static final _instance = RouteApi._();

  static RouteApi get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://router.hereapi.com/v8/routes',
      connectTimeout: 10000,
      receiveTimeout: 90000,
    ),
  );
}
