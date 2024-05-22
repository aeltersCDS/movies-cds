import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class MoviesRestInterceptor extends Interceptor {
  // TODO: See if we can inject this
  final logger = Logger();
  // TODO: see if we can hide this
  final token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2NkZjdjNWRjNzU1NDJlZTU5MWI2YjM3OGEzMmNlMSIsInN1YiI6IjVkMDc4ZmIzMGUwYTI2NjBiMmNhNDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K81jj8N-GgySspE9AsP9daKrIUKIHbgkhAngdo2ZK5g";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.d('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}