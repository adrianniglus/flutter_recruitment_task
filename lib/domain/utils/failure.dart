import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

// This class is used to represent a failure in the application
@freezed
class Failure with _$Failure {
  const factory Failure({
    String? content,
  }) = _Failure;
}
