import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';
part 'api_exception.g.dart';

// This class is used to represent an exception in the application
// Used to handle exceptions from the API
// Than converted to a Failure object
@freezed
class ApiException with _$ApiException {
  const factory ApiException({
    String? message,
  }) = _ApiException;

  factory ApiException.fromJson(Map<String, dynamic> json) => _$ApiExceptionFromJson(json);
}
