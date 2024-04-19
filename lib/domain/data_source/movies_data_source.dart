import '../../data/dtos/movies/movie_dto.dart';
import '../../data/dtos/movies/movie_query_dto.dart';
import '../../data/dtos/pagination_response_dto.dart';

abstract class MoviesDataSource {
  Future<PaginationResponseDto<MovieDto>> searchMovies(MovieQueryDto movieQuery, String apiKey);
}
