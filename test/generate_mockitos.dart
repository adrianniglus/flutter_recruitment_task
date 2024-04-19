import 'package:flutter_recruitment_task/data/api/api_client.dart';
import 'package:flutter_recruitment_task/data/handlers/key_handler.dart';
import 'package:flutter_recruitment_task/domain/data_source/movies_data_source.dart';
import 'package:flutter_recruitment_task/domain/repositories/movies_repository.dart';
import 'package:flutter_recruitment_task/domain/use_cases/movies/get_movie_details_use_case.dart';
import 'package:flutter_recruitment_task/domain/use_cases/movies/search_movie_use_case.dart';
import 'package:flutter_recruitment_task/domain/use_cases/universal/get_current_datetime_use_case.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MoviesRepository,
  MoviesDataSource,
  GetCurrentDateTimeUseCase,
  SearchMovieUseCase,
  GetMovieDetailsUseCase,
  KeyHandler,
  ApiClient,
])
void main() {
  // This file is only used to generate mockitos
  // and should not contain any code
}
