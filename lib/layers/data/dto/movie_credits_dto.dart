import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/data/dto/cast_member_dto.dart';
import 'package:movies_cds/layers/data/dto/crew_member_dto.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';

part 'movie_credits_dto.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@ApiDateConverter()
class MovieCreditsDto {
  MovieCreditsDto({
    required this.cast,
    required this.crew,
  });

  List<CastMemberDto> cast;
  List<CrewMemberDto> crew;

  factory MovieCreditsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsDtoToJson(this);

  MovieCredits toDomain() => MovieCredits(
        cast: cast.map((member) => member.toDomain()).toList(),
        crew: crew.map((member) => member.toDomain()).toList(),
      );
}
