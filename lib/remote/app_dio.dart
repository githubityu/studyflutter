import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/app_error_2.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/model/http_result.dart';

import 'dio_flutter_transformer.dart';

final dioProvider = Provider((_) => AppDio.getInstance());

// ignore: prefer_mixin
class AppDio with DioMixin {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: Constants.endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    transformer = FlutterTransformer();
    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      handler.next(options);
    }, onResponse: (e, handler) {
      if (e.statusCode == 200) {
        if (isFromService(e)) {
          HttpResult result = HttpResult.fromJson(e.data);
          if (result.code == "1") {
            //e.data = e.data["data"];
            handler.next(e);
          } else {
            throw AppError2(result.msg, result.code.toString());
          }
        } else {
          handler.next(e);
        }
      } else {
        throw AppError2("异常信息", e.statusCode.toString());
      }
    }));

    if (kIsWeb) {
      //httpClientAdapter = BrowserHttpClientAdapter();
    } else {
      httpClientAdapter = DefaultHttpClientAdapter();
    }
  }

  static Dio getInstance() => AppDio._();
}
