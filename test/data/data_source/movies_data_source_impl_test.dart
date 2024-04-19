import 'package:flutter_recruitment_task/data/data_source/movies_data_source_impl.dart';
import 'package:flutter_recruitment_task/data/dtos/movies/movie_dto.dart';
import 'package:flutter_recruitment_task/data/dtos/movies/movie_query_dto.dart';
import 'package:flutter_recruitment_task/data/dtos/pagination_response_dto.dart';
import 'package:flutter_recruitment_task/domain/utils/api_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../generate_mockitos.mocks.dart';

void main() {
  late MoviesDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  // Constants for testing
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
  const movieQuery = const MovieQueryDto(
    query: 'Title',
    page: 1,
  );
  const apiKey = '12345';

  // Repository setup
  setUp(() => {
        mockApiClient = MockApiClient(),
        dataSource = MoviesDataSourceImpl(mockApiClient),
      });

  group(
    'Movie Search',
    () {
      test(
        'Should return a PaginationResponse<MovieDto>() when the search is successful',
        () async {
          // Arrange
          when(mockApiClient.searchMovies(query: anyNamed('query'), page: anyNamed('page'), apiKey: anyNamed('apiKey')))
              .thenAnswer((_) async => paginationResponseDto);
          // Act
          final result = await dataSource.searchMovies(movieQuery, apiKey);
          // Assert
          expect(result, paginationResponseDto);
        },
      );
      test(
        'Should throw an ApiException when the search fails',
        () async {
          // Arrange
          when(mockApiClient.searchMovies(query: anyNamed('query'), page: anyNamed('page'), apiKey: anyNamed('apiKey')))
              .thenThrow(apiException);
          // Act
          final result = dataSource.searchMovies(movieQuery, apiKey);
          // Assert
          expect(result, throwsA(apiException));
        },
      );
    },
  );

  group(
    'Movie Details Fetch',
    () {
      test(
        'Should return a MovieDto() when the search is successful',
        () async {
          // Arrange
          when(mockApiClient.getMovieDetails(id: anyNamed('id'), apiKey: anyNamed('apiKey')))
              .thenAnswer((_) async => movieDto);
          // Act
          final result = await dataSource.getMovieDetails(movieDto.id, apiKey);
          // Assert
          expect(result, movieDto);
        },
      );
      test(
        'Should throw an ApiException() when the search fails',
        () async {
          // Arrange
          when(mockApiClient.getMovieDetails(id: anyNamed('id'), apiKey: anyNamed('apiKey'))).thenThrow(apiException);
          // Act
          final result = dataSource.getMovieDetails(movieDto.id, apiKey);
          // Assert
          expect(result, throwsA(apiException));
        },
      );
    },
  );
}
