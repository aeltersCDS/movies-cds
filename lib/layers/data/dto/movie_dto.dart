import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@ApiDateConverter()
class MovieDto extends Movie {
  MovieDto(
      {required super.id,
      required super.title,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.voteAverage,
      required super.voteCount});

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
}
