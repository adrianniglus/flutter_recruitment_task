import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dtos/movies/movie_details_dto.dart';



part 'movie_details.freezed.dart';

@freezed
class MovieDetails with _$MovieDetails {
   const factory MovieDetails({
    required String title,
    required String content,
  }) = _MovieDetails;

  factory MovieDetails.fromDto(MovieDetailsDto dto) => MovieDetails(
        title: dto.title,
        content: dto.content,
      );
}
