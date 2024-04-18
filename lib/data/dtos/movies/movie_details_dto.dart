import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_dto.freezed.dart';
part 'movie_details_dto.g.dart';


@freezed
class MovieDetailsDto with _$MovieDetailsDto {
  const factory MovieDetailsDto({
    required String title,
    required String content,
  }) = _MovieDetailsDto;

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) => _$MovieDetailsDtoFromJson(json);
}
