import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movies_cds/env/env.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoviesRestInterceptor extends Interceptor {
  final Logger _logger;

  MoviesRestInterceptor({required Logger logger}) : _logger = logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers["Authorization"] = "Bearer ${Env.tmdbApiKey}";
    final currentLanguage = PlatformDispatcher.instance.locale.languageCode;
    final supportedLanguages =
        AppLocalizations.supportedLocales.map((locale) => locale.languageCode);
    if (supportedLanguages.contains(currentLanguage)) {
      options.queryParameters["language"] = currentLanguage;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    _logger.d(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
