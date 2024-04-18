import '../../data/dtos/movies/movie_list_response_dto.dart';

abstract class MoviesDataSource {
  Future<MovieListResponseDto> searchMovies(String query, String apiKey);
}
