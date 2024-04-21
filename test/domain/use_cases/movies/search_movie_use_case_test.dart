import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie_query.dart';
import 'package:flutter_recruitment_task/domain/models/pagination/pagination_response.dart';
import 'package:flutter_recruitment_task/domain/use_cases/movies/search_movie_use_case.dart';
import 'package:flutter_recruitment_task/domain/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../generate_mockitos.mocks.dart';

void main() {
  late SearchMovieUseCase useCase;
  late MockMoviesRepository mockMoviesRepository;

  const movieQuery = MovieQuery();
  final movie = Movie(
    id: 1,
    title: 'Title',
    voteAverage: 1.0,
    budget: null,
    revenue: null,
  );
  PaginationResponse<Movie> paginationResponse = PaginationResponse(
    page: 1,
    totalPages: 1,
    results: [movie],
  );
  const failure = Failure();

  setUp(() {
    mockMoviesRepository = MockMoviesRepository();
    useCase = SearchMovieUseCase(mockMoviesRepository);
  });

  group('SearchMovieUseCase', () {
    test('Should return a PaginationResponse<Movie> when the repository returns a paginated list', () async {
      // Arrange
      when(mockMoviesRepository.searchMovies(any)).thenAnswer((_) async => Right(paginationResponse));
      // Act
      final result = await useCase(movieQuery);
      // Assert
      expect(result, Right(paginationResponse));
    });

    test('Should return a Failure() when the repository returns a failure', () async {
      // Arrange
      when(mockMoviesRepository.searchMovies(any)).thenAnswer((_) async => Left(failure));
      // Act
      final result = await useCase(const MovieQuery());
      // Assert
      expect(result, Left(failure));
    });
  });
}
