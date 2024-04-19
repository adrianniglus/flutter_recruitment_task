import 'package:json_annotation/json_annotation.dart';

const _voteAverageDesc = 'vote_average.desc';
const _popularityDesc = 'popularity.desc';
const _voteAverageAsc = 'vote_average.asc';
const _popularityAsc = 'popularity.asc';

// An enum that represents the different ways to sort movies.
enum SortBy {
  @JsonValue(_voteAverageDesc)
  voteAverageDesc,
  @JsonValue(_popularityDesc)
  popularityDesc,
  @JsonValue(_voteAverageAsc)
  voteAverageAsc,
  @JsonValue(_popularityAsc)
  popularityAsc;

  String get jsonValue {
    switch (this) {
      case SortBy.voteAverageDesc:
        return _voteAverageDesc;
      case SortBy.popularityDesc:
        return _popularityDesc;
      case SortBy.voteAverageAsc:
        return _voteAverageAsc;
      case SortBy.popularityAsc:
        return _popularityAsc;
    }
  }
}
