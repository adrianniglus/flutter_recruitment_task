import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../models/movies/movie.dart';
import '../../models/movies/movie_query.dart';
import '../../models/pagination/pagination_response.dart';
import '../../repositories/movies_repository.dart';
import '../../utils/failure.dart';
import '../../utils/use_case.dart';

@injectable
class SearchMovieUseCase implements UseCase<PaginationResponse<Movie>, MovieQuery> {
  const SearchMovieUseCase(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<Either<Failure, PaginationResponse<Movie>>> call(MovieQuery query) async => await _moviesRepository.searchMovies(query);
}
