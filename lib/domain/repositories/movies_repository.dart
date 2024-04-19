import 'package:dartz/dartz.dart';

import '../models/movies/movie.dart';
import '../models/movies/movie_query.dart';
import '../models/pagination/pagination_response.dart';
import '../utils/failure.dart';

abstract class MoviesRepository {
  Future<Either<Failure, PaginationResponse<Movie>>> searchMovies(MovieQuery query);
  Future<Either<Failure, Movie>> getMovieDetails(int movieId);
}
