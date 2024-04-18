import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/movies/movie_list_response.dart';
import '../repositories/movies_repository.dart';
import '../utils/failure.dart';
import '../utils/use_case.dart';

@injectable
class SearchMovieUseCase implements UseCase<MovieListResponse, String> {
  const SearchMovieUseCase(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<Either<Failure, MovieListResponse>> call(String query) async => await _moviesRepository.searchMovies(query);
}
