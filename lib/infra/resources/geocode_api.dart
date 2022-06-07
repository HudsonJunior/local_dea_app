import 'package:dio/dio.dart';

class GeocodeApi {
  GeocodeApi._();

  static final _instance = GeocodeApi._();

  static GeocodeApi get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://geocode.search.hereapi.com/v1/geocode',
      connectTimeout: 10000,
      receiveTimeout: 90000,
    ),
  );
}
