import 'package:dartz/dartz.dart';

import '../models/movies/movie_list_response.dart';
import '../utils/failure.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieListResponse>> searchMovies(String query);
}