import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/movies/movie_list_dto.dart';
import 'movie.dart';

part 'movie_list.freezed.dart';

@freezed
class MovieList with _$MovieList {
  const factory MovieList({
    required int totalResults,
    required List<Movie> results,
  }) = _MovieList;

  factory MovieList.fromDto(MovieListDto dto) => MovieList(
        totalResults: dto.totalResults,
        results: dto.results.map((e) => Movie.fromDto(e)).toList(),
      );
}
