import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_response_dto.freezed.dart';
part 'pagination_response_dto.g.dart';

@Freezed(toJson: false, genericArgumentFactories: true)
class PaginationResponseDto<T> with _$PaginationResponseDto<T> {
  factory PaginationResponseDto({
    required List<T> results,
    required int page,
    required int totalPages,
  }) = _PaginationResponseDto<T>;

  factory PaginationResponseDto.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseDtoFromJson<T>(json, fromJsonT);
}
