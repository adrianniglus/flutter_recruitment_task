import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/data_source/movies_data_source.dart';
import '../../domain/models/movies/movie_list_response.dart';
import '../../domain/repositories/movies_repository.dart';
import '../../domain/utils/api_exception.dart';
import '../../domain/utils/failure.dart';

@Singleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(
    this._moviesDataSource,
  );

  final MoviesDataSource _moviesDataSource;

  static const apiKey = '052afdb6e0ab9af424e3f3c8edbb33fb';

  @override
  Future<Either<Failure, MovieListResponse>> searchMovies(String query) async {
    try {
      final result = await _moviesDataSource.searchMovies(query, apiKey);
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
