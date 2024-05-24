import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/movies/movie_query.dart';

part 'movie_query_dto.freezed.dart';

@freezed
class MovieQueryDto with _$MovieQueryDto {
  const factory MovieQueryDto({
    String? query,
    int? page,
    String? sortBy,
  }) = _MovieQueryDto;

  factory MovieQueryDto.fromModel(MovieQuery movieQuery) => MovieQueryDto(
        query: movieQuery.query,
        page: movieQuery.page,
        sortBy: movieQuery.sortBy?.jsonValue,
      );
}
