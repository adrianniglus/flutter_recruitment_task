import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
class MovieDto with _$MovieDto {
  const factory MovieDto({
    required int id,
    required String title,
    required double voteAverage,
    required int? budget,
    required int? revenue,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);
}
