import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_query.freezed.dart';

@freezed
class MovieQuery with _$MovieQuery {
  const factory MovieQuery({
    String? query,
    int? page,
  }) = _MovieQuery;
}
