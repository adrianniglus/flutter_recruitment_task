import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_dto.dart';

part 'movie_list_dto.freezed.dart';
part 'movie_list_dto.g.dart';

@freezed
class MovieListDto with _$MovieListDto {
  const factory MovieListDto({
    required int totalResults,
    required List<MovieDto> results,
  }) = _MovieListDto;

  factory MovieListDto.fromJson(Map<String, dynamic> json) => _$MovieListDtoFromJson(json);
}
