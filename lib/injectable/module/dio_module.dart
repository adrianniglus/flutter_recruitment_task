import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/handlers/environment_handler.dart';
import '../../data/utils/consts.dart';


// This module allows us to inject the Dio client into our classes
@module
abstract class ApiModule {
  @singleton
  Dio get client => Dio(BaseOptions(baseUrl: getApiLinkByFlavor, contentType: Headers.jsonContentType))
    ..interceptors.addAll(
      [
        // PrettyDioLogger is a Dio interceptor that logs pretty print request and response data
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          request: true,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
        // More interceptors can be added here
      ],
    );

  // This method returns the API link based on the current environment
  String get getApiLinkByFlavor {
    switch (EnvironmentHandler.current) {
      case EnvironmentType.prod:
        return prodApi;
      default:
        return stagingApi;
    }
  }
}
