import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/models/movies/movie.dart';
import '../../../../../../domain/utils/failure.dart';

part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.loading() = _Loading;

  const factory MovieDetailsState.loaded({
    required Movie movie,
    required bool shouldBeWatched,
  }) = _Loaded;

  const factory MovieDetailsState.failure({
    required Failure failure,
  }) = _Failure;
}
