import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:reqres/di.dart';
import 'package:reqres/system/api_error.dart';
import 'package:stack_trace/stack_trace.dart';

typedef ApiGet = Future<Map<String, dynamic>> Function(
  String url, {
  Map<String, dynamic>? queryParams,
  Map<String, dynamic>? additionalHeaders,
});

typedef ApiPost = Future<Map<String, dynamic>> Function(
  String url, {
  Map<String, dynamic>? requestBody,
  Map<String, dynamic>? queryParams,
  Map<String, dynamic>? additionalHeaders,
});

ApiGet get apiGet => _get;

ApiPost get apiPost => _post;

Options _getMergedOptions({
  Map<String, dynamic>? extraHeaders,
}) {
  Map<String, dynamic> headers = getIt<Dio>().options.headers;
  if (extraHeaders != null && extraHeaders.isNotEmpty) {
    headers.addAll(extraHeaders);
  }

  return Options(headers: headers);
}

Map<String, dynamic> _process(Response<String> value) {
  if (value.statusCode != null &&
      value.statusCode! >= 200 &&
      value.statusCode! < 300 &&
      value.data != null) {
    return jsonDecode(value.data!) as Map<String, dynamic>;
  } else {
    final stacktrace = Trace.current(20).original.toString();
    throw ApiErrorException(value.statusMessage, value.statusCode!,
        stacktrace: stacktrace);
  }
}

Future<Map<String, dynamic>> _get(
  String url, {
  Map<String, dynamic>? queryParams,
  Map<String, dynamic>? additionalHeaders,
}) =>
    getIt<Dio>()
        .get<String>(url,
            queryParameters: queryParams,
            options: _getMergedOptions(extraHeaders: additionalHeaders))
        .then((Response<String> value) {
          return _process(value);
        });

Future<Map<String, dynamic>> _post(
  String url, {
  Map<String, dynamic>? requestBody,
  Map<String, dynamic>? queryParams,
  Map<String, dynamic>? additionalHeaders,
}) =>
    getIt<Dio>()
        .post<String>(url,
            queryParameters: queryParams,
            data: requestBody,
            options: _getMergedOptions(extraHeaders: additionalHeaders))
        .then((Response<String> value) => _process(value));
