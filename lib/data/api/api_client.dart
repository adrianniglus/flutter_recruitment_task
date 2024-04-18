import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/models/movies/movie.dart';
import '../dtos/movies/movie_list_dto.dart';

class ApiService {
  static const apiKey = '052afdb6e0ab9af424e3f3c8edbb33fb';
  static const baseUrl = 'api.themoviedb.org';

  Future<List<Movie>> searchMovies(String query) async {
    final parameters = {
      'api_key': apiKey,
      'query': query,
    };

    final endpoint = Uri.https(baseUrl, '/3/search/movie', parameters);

    final response = await http.get(endpoint);
    final json = jsonDecode(response.body);
    final movieList = MovieListDto.fromJson(json);

    return movieList.results.map((e) => Movie.fromDto(e)).toList();
  }
}
