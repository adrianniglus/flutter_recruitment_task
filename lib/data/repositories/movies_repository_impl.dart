import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/data_source/movies_data_source.dart';
import '../../domain/models/movies/movie.dart';
import '../../domain/models/movies/movie_query.dart';
import '../../domain/models/pagination/pagination_response.dart';
import '../../domain/repositories/movies_repository.dart';
import '../../domain/utils/api_exception.dart';
import '../../domain/utils/failure.dart';
import '../dtos/movies/movie_query_dto.dart';
import '../handlers/key_handler.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(
    this._moviesDataSource,
  );

  final MoviesDataSource _moviesDataSource;

  // Search movies by query string (title) and return a list of movies
  @override
  Future<Either<Failure, PaginationResponse<Movie>>> searchMovies(MovieQuery query) async {
    try {
      final result =
          await _moviesDataSource.searchMovies(MovieQueryDto.fromModel(query), KeyHandler().getApiKeyByFlavor);
      return Right(
        PaginationResponse<Movie>(
          page: result.page,
          totalPages: result.totalPages,
          results: result.results.map((e) => Movie.fromDto(e)).toList(),
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          content: e is ApiException ? e.message : null,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    try {
      final result = await _moviesDataSource.getMovieDetails(movieId, KeyHandler().getApiKeyByFlavor);
      return Right(Movie.fromDto(result));
    } catch (e) {
      return Left(
        Failure(
          content: e is ApiException ? e.message : null,
        ),
      );
    }
  }
}
