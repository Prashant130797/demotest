import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Dioclient {
  Dio? dio;

  Dioclient.defaultClient({BaseOptions? baseoptions}) {
    if (kDebugMode) {}
    baseoptions ??= BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
    dio = Dio(baseoptions);
    dio!.interceptors.add(PrettyDioLogger());
  }
}
