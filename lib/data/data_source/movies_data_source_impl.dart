import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/data_source/movies_data_source.dart';
import '../../domain/utils/api_exception.dart';
import '../../domain/utils/extensions/dio_exception_extension.dart';
import '../api/api_client.dart';
import '../dtos/movies/movie_dto.dart';
import '../dtos/movies/movie_query_dto.dart';
import '../dtos/pagination_response_dto.dart';

@Singleton(as: MoviesDataSource)
class MoviesDataSourceImpl implements MoviesDataSource {
  MoviesDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<PaginationResponseDto<MovieDto>> searchMovies(MovieQueryDto movieQuery, String apiKey) async {
    try {
      return await _apiClient.searchMovies(
        query: movieQuery.query,
        page: movieQuery.page,
        apiKey: apiKey,
      );
    } on DioException catch (e) {
      throw ApiException.fromJson(e.getErrorData);
    }
  }
}
