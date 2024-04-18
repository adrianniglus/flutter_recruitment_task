import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/movies/movie_dto.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required double voteAverage,
  }) = _Movie;

  factory Movie.fromDto(MovieDto dto) => Movie(
        id: dto.id,
        title: dto.title,
        voteAverage: dto.voteAverage,
      );
}
