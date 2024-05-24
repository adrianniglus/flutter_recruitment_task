import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/enums/sort_by.dart';

part 'movie_query.freezed.dart';

@freezed
class MovieQuery with _$MovieQuery {
  const factory MovieQuery({
    String? query,
    int? page,
    SortBy? sortBy,
  }) = _MovieQuery;
}
