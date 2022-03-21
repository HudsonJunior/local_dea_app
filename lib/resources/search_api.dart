import 'package:dio/dio.dart';

class SearchApi {
  SearchApi._();

  static final _instance = SearchApi._();

  static SearchApi get instance => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://discover.search.hereapi.com/v1/discover',
      connectTimeout: 10000,
      receiveTimeout: 90000,
    ),
  );
}
