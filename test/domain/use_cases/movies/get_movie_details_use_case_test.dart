import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/domain/models/movies/movie.dart';
import 'package:flutter_recruitment_task/domain/use_cases/movies/get_movie_details_use_case.dart';
import 'package:flutter_recruitment_task/domain/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../generate_mockitos.mocks.dart';

void main() {
  late GetMovieDetailsUseCase useCase;
  late MockMoviesRepository mockMoviesRepository;

  final movie = Movie(
    id: 1,
    title: 'Title',
    voteAverage: 1.0,
    budget: null,
    revenue: null,
  );
  const failure = Failure();

  setUp(() {
    mockMoviesRepository = MockMoviesRepository();
    useCase = GetMovieDetailsUseCase(mockMoviesRepository);
  });

  group('GetMovieDetailsUseCase', () {
    test('Should return a Movie() when the repository returns a movie', () async {
      // Arrange
      when(mockMoviesRepository.getMovieDetails(any)).thenAnswer((_) async => Right(movie));
      // Act
      final result = await useCase(1);
      // Assert
      expect(result, Right(movie));
    });

    test('Should return a Failure() when the repository returns a failure', () async {
      // Arrange
      when(mockMoviesRepository.getMovieDetails(any)).thenAnswer((_) async => Left(failure));
      // Act
      final result = await useCase(1);
      // Assert
      expect(result, Left(failure));
    });
  });
}
