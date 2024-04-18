import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';
part 'api_exception.g.dart';

@freezed
class ApiException with _$ApiException {
  const factory ApiException({
    String? message,
  }) = _ApiException;

  factory ApiException.fromJson(Map<String, dynamic> json) => _$ApiExceptionFromJson(json);
}
