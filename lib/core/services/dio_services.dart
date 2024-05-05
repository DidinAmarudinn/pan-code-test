import 'package:dio/dio.dart';
import 'package:pan_code_test/core/constants/environment.dart';

Dio dioServices() {
  Dio dio = Dio();
  dio.options.baseUrl = Environment.devApi;
  dio.options.headers.addAll({
    "app-id":"663612ff64cb5dad3155c219"
  });


  return dio;
}