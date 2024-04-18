import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../dtos/movies/movie_dto.dart';
import '../network_config/api_endpoints.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) => _ApiClient(dio);
  static const apiKey = '052afdb6e0ab9af424e3f3c8edbb33fb';

  // Search movies by query string (title) and return a list of movies
  @GET(ApiEndpoints.searchMovie)
  Future<List<MovieDto>> searchMovies({
    @Query('query') required String query,
  });
}
