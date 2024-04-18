import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_dto.dart';

part 'movie_list_response_dto.freezed.dart';
part 'movie_list_response_dto.g.dart';

@freezed
class MovieListResponseDto with _$MovieListResponseDto {
  const factory MovieListResponseDto({
    required int totalResults,
    required List<MovieDto> results,
  }) = _MovieListDto;

  factory MovieListResponseDto.fromJson(Map<String, dynamic> json) => _$MovieListResponseDtoFromJson(json);
}
