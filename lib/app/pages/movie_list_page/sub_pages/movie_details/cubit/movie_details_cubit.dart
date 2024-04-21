import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/use_cases/movies/get_movie_details_use_case.dart';
import '../../../../../../domain/use_cases/universal/get_current_datetime_use_case.dart';
import 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(
    this._getMovieDetailsUseCase,
    this._getCurrentDateTimeUseCase,
  ) : super(const MovieDetailsState.loading());

  GetMovieDetailsUseCase _getMovieDetailsUseCase;
  GetCurrentDateTimeUseCase _getCurrentDateTimeUseCase;

  // This value determines the minimal profit for a movie to be watched
  static const minimalProfitToWatchMovie = 1000000;

  // Initialize the cubit with a movie id to get the more details
  // and check if the movie should be watched
  Future<void> init(int movieId) async {
    final result = await _getMovieDetailsUseCase(movieId);
    emit(
      result.fold(
        (failure) => MovieDetailsState.failure(failure: failure),
        (movie) {
          final curentDatetime = _getCurrentDateTimeUseCase();
          // Check if the movie should be watched based on the current day and profit
          final shouldBeWatched = curentDatetime.weekday == DateTime.sunday && movie.profit > minimalProfitToWatchMovie;
          return MovieDetailsState.loaded(movie: movie, shouldBeWatched: shouldBeWatched);
        },
      ),
    );
  }

  // Refresh the movie details
  Future<void> refresh(int movieId) async {
    emit(const MovieDetailsState.loading());
    await init(movieId);
  }
}
