import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/data_source/movies_data_source.dart';
import '../../domain/utils/api_exception.dart';
import '../../domain/utils/extensions/dio_exception_extension.dart';
import '../api/api_client.dart';
import '../dtos/movies/movie_list_response_dto.dart';

@Singleton(as: MoviesDataSource)
class MoviesDataSourceImpl implements MoviesDataSource {
  MoviesDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<MovieListResponseDto> searchMovies(String query, String apiKey) async {
    try {
      var a = await _apiClient.searchMovies(query: query, apiKey: apiKey);
      return a;
    } on DioException catch (e) {
      throw ApiException.fromJson(e.getErrorData);
    }
  }
}
