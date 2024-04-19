import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/movies/movie_dto.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required int id,
    required String title,
    required double voteAverage,
    required int? budget,
    required int? revenue,
  }) = _Movie;
  Movie._();

  factory Movie.fromDto(MovieDto dto) => Movie(
        id: dto.id,
        title: dto.title,
        voteAverage: dto.voteAverage,
        budget: dto.budget,
        revenue: dto.revenue,
      );

  // Returns the profit of the movie, which is the revenue minus the budget.
  int get profit => revenue == null || budget == null ? 0 : revenue! - budget!;
}
