import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/pagination_response_dto.dart';

part 'pagination_response.freezed.dart';

@freezed
class PaginationResponse<T> with _$PaginationResponse<T> {
  const factory PaginationResponse({
    required List<T> results,
    required int page,
    required int totalPages,
  }) = _PaginationResponse<T>;

  factory PaginationResponse.fromDto(PaginationResponseDto<T> dto) => PaginationResponse(
        results: dto.results,
        page: dto.page,
        totalPages: dto.totalPages,
      );
}