import 'package:dio/dio.dart';

extension ErrorParser on DioException {
  Map<String, dynamic> get getErrorData => response?.data?['message'] ?? {};
}
