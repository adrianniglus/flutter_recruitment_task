import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../dtos/movies/movie_list_response_dto.dart';
import '../network_config/api_endpoints.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) => _ApiClient(dio);

  // Search movies by query string (title) and return a list of movies
  @GET(ApiEndpoints.searchMovie)
  Future<MovieListResponseDto> searchMovies({
    @Query('query') required String query,
    @Query('api_key') required String apiKey,
  });
}
