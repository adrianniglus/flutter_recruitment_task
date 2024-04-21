import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/app/pages/movie_list_page/sub_pages/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_recruitment_task/app/pages/movie_list_page/sub_pages/movie_details/cubit/movie_details_state.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie.dart';
import 'package:flutter_recruitment_task/domain/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../generate_mockitos.mocks.dart';

void main() {
  late MovieDetailsCubit cubit;
  late MockGetMovieDetailsUseCase getMovieDetailsUseCase;
  late MockGetCurrentDateTimeUseCase getCurrentDateTimeUseCase;

  // Arrange constants for testing
  final movie = Movie(
    id: 1,
    title: 'Title',
    voteAverage: 1.0,
    budget: null,
    revenue: null,
  );
  final profitableMovie = Movie(
    id: 1,
    title: 'Title',
    voteAverage: 1.0,
    budget: 0,
    revenue: 10000000,
  );
  final dateTime = DateTime(2022, 1, 2);
  const failure = Failure();

  // Cubit setup
  setUp(() {
    getMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    getCurrentDateTimeUseCase = MockGetCurrentDateTimeUseCase();
    cubit = MovieDetailsCubit(getMovieDetailsUseCase, getCurrentDateTimeUseCase);
  });

  // Cubit teardown
  tearDown(() {
    cubit.close();
  });

  group('Init Cubit', () {
    blocTest(
      'Should emit [Loaded] when the use case returns a movie',
      build: () {
        when(getMovieDetailsUseCase(any)).thenAnswer((_) async => Right(movie));
        when(getCurrentDateTimeUseCase()).thenReturn(dateTime);
        return cubit;
      },
      act: (cubit) => cubit.init(1),
      expect: () => [
        MovieDetailsState.loaded(movie: movie, shouldBeWatched: false),
      ],
    );

    blocTest(
      'Should emit [Failure] when the use case returns a failure',
      build: () {
        when(getMovieDetailsUseCase(any)).thenAnswer((_) async => Left(failure));
        return cubit;
      },
      act: (cubit) => cubit.init(1),
      expect: () => [
        const MovieDetailsState.failure(failure: failure),
      ],
    );

    blocTest(
      'Should emit [Loaded] with shouldBeWatched = true when the movie profit is greater than minimalProfitToWatchMovie',
      build: () {
        when(getMovieDetailsUseCase(any)).thenAnswer((_) async => Right(profitableMovie));
        when(getCurrentDateTimeUseCase()).thenReturn(dateTime);
        return cubit;
      },
      act: (cubit) => cubit.init(1),
      expect: () => [
        MovieDetailsState.loaded(movie: profitableMovie, shouldBeWatched: true),
      ],
    );
  });
  group('Refresh Movie Details', () {
    blocTest(
      'Should emit [Loading, Loaded] when the use case returns a movie',
      build: () {
        when(getMovieDetailsUseCase(any)).thenAnswer((_) async => Right(movie));
        when(getCurrentDateTimeUseCase()).thenReturn(dateTime);
        return cubit;
      },
      act: (cubit) => cubit.refresh(1),
      expect: () => [
        const MovieDetailsState.loading(),
        MovieDetailsState.loaded(movie: movie, shouldBeWatched: false),
      ],
    );
    blocTest(
      'Should emit [Loading, Failure] when the use case returns a failure',
      build: () {
        when(getMovieDetailsUseCase(any)).thenAnswer((_) async => Left(failure));
        return cubit;
      },
      act: (cubit) => cubit.refresh(1),
      expect: () => [
        const MovieDetailsState.loading(),
        const MovieDetailsState.failure(failure: failure),
      ],
    );
  });
}
