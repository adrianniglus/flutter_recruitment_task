import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/data/dtos/movies/movie_dto.dart';
import 'package:flutter_recruitment_task/data/dtos/pagination_response_dto.dart';
import 'package:flutter_recruitment_task/data/repositories/movies_repository_impl.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie_query.dart';
import 'package:flutter_recruitment_task/domain/models/pagination/pagination_response.dart';
import 'package:flutter_recruitment_task/domain/utils/api_exception.dart';
import 'package:flutter_recruitment_task/domain/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../generate_mockitos.mocks.dart';

void main() {
  late MoviesRepositoryImpl repository;
  late MockMoviesDataSource mockMoviesDataSource;
  late MockKeyHandler mockKeyHandler;

  // Constants for testing
  const Failure failure = Failure();
  const ApiException apiException = ApiException();
  const movieDto = const MovieDto(
    id: 1,
    title: 'Title',
    voteAverage: 1.0,
    budget: null,
    revenue: null,
  );
  final paginationResponseDto = PaginationResponseDto<MovieDto>(
    page: 1,
    totalPages: 1,
    results: [movieDto],
  );
  const movieQuery = const MovieQuery(
    query: 'Title',
    page: 1,
  );
  const apiKey = '12345';

  // Repository setup
  setUp(() => {
        mockMoviesDataSource = MockMoviesDataSource(),
        mockKeyHandler = MockKeyHandler(),
        repository = MoviesRepositoryImpl(mockMoviesDataSource, mockKeyHandler),
      });

  group(
    'Movie Search',
    () {
      test(
        'Should return a PaginationResponse<Movie>() when the search is successful',
        () async {
          // Arrange
          when(mockMoviesDataSource.searchMovies(any, any)).thenAnswer((_) async => paginationResponseDto);
          when(mockKeyHandler.getApiKeyByFlavor).thenReturn(apiKey);

          // Act
          final result = await repository.searchMovies(movieQuery);

          //Assert
          expect(
              result,
              Right(
                PaginationResponse<Movie>(
                  page: paginationResponseDto.page,
                  totalPages: paginationResponseDto.totalPages,
                  results: paginationResponseDto.results.map((e) => Movie.fromDto(e)).toList(),
                ),
              ));
        },
      );

      test(
        'Should return a Failure() when the search fails',
        () async {
          when(mockMoviesDataSource.searchMovies(any, any)).thenThrow(apiException);
          when(mockKeyHandler.getApiKeyByFlavor).thenReturn(apiKey);

          final result = await repository.searchMovies(movieQuery);
          expect(result.isLeft(), true);
          expect(
            result,
            Left(failure),
          );
        },
      );
    },
  );

  group(
    'Movie Details Fetch',
    () {
      test(
        'Should return a Movie() when the fetch is successful',
        () async {
          // Arrange
          when(mockMoviesDataSource.getMovieDetails(any, any)).thenAnswer((_) async => movieDto);
          when(mockKeyHandler.getApiKeyByFlavor).thenReturn(apiKey);

          // Act
          final result = await repository.getMovieDetails(movieDto.id);

          //Assert
          expect(
            result,
            Right(Movie.fromDto(movieDto)),
          );
        },
      );

      test(
        'Should return a Failure() when the fetch fails',
        () async {
          when(mockMoviesDataSource.getMovieDetails(any, any)).thenThrow(apiException);
          when(mockKeyHandler.getApiKeyByFlavor).thenReturn(apiKey);

          final result = await repository.getMovieDetails(movieDto.id);
          expect(result.isLeft(), true);
          expect(
            result,
            Left(failure),
          );
        },
      );
    },
  );
}
