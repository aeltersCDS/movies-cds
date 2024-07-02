import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@ApiDateConverter()
class MovieDto {
  MovieDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  int id;
  String? title;
  String? name;
  String overview;
  double popularity;
  String? posterPath;
  DateTime? releaseDate;
  DateTime? firstAirDate;
  double voteAverage;
  int voteCount;
  String? status;
  String? originalLanguage;
  int? runtime;
  int? budget;
  int? revenue;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

  Movie toDomain() => Movie(
        id: id,
        title: title ?? name ?? "",
        overview: overview,
        popularity: popularity,
        posterUrl:
            posterPath != null ? "${Api.imagesBaseUrl}$posterPath" : null,
        releaseDate: releaseDate ?? firstAirDate ?? DateTime.now(),
        voteAverage: voteAverage,
        voteCount: voteCount,
        status: status,
        originalLanguage: originalLanguage,
        runtime: runtime,
        budget: budget,
        revenue: revenue,
      );
}
