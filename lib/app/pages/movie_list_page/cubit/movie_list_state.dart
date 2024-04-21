import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../domain/models/movies/movie.dart';
import '../../../../domain/utils/failure.dart';

part 'movie_list_state.freezed.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.loading() = _Loading;

  const factory MovieListState.loaded({
    required PagingController<int, Movie> pagingController,
  }) = _Loaded;

  const factory MovieListState.failure({
    required Failure failure,
  }) = _Failure;
}
