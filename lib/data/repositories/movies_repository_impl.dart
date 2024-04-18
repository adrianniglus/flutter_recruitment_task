import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/data_source/movies_data_source.dart';
import '../../domain/models/movies/movie_list_response.dart';
import '../../domain/repositories/movies_repository.dart';
import '../../domain/utils/api_exception.dart';
import '../../domain/utils/failure.dart';
import '../handlers/key_handler.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(
    this._moviesDataSource,
  );

  final MoviesDataSource _moviesDataSource;

  @override
  Future<Either<Failure, MovieListResponse>> searchMovies(String query) async {
    try {
      final result = await _moviesDataSource.searchMovies(query, KeyHandler.tmdbApiKey);
      return Right(MovieListResponse.fromDto(result));
    } catch (e) {
      return Left(
        Failure(
          content: e is ApiException ? e.message : null,
        ),
      );
    }
  }
}
