import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../models/movies/movie.dart';
import '../../repositories/movies_repository.dart';
import '../../utils/failure.dart';
import '../../utils/use_case.dart';

@injectable
class GetMovieDetailsUseCase implements UseCase<Movie, int> {
  const GetMovieDetailsUseCase(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  @override
  Future<Either<Failure, Movie>> call(int movieId) async => await _moviesRepository.getMovieDetails(movieId);
}
