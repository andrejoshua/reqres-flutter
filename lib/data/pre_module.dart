import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PreModule {
  @lazySingleton
  Dio get dio {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://reqres.in',
      followRedirects: false,
      validateStatus: (int? status) => status != null && status < 500,
      contentType: 'application/json; charset=utf-8',
    );

    final dio = Dio(options);
    dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    return dio;
  }
}