import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/movies/movie_list_response_dto.dart';
import 'movie.dart';

part 'movie_list_response.freezed.dart';

@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    required int totalResults,
    required List<Movie> results,
  }) = _MovieListResponse;

  factory MovieListResponse.fromDto(MovieListResponseDto dto) => MovieListResponse(
        totalResults: dto.totalResults,
        results: dto.results.map((e) => Movie.fromDto(e)).toList(),
      );
}
