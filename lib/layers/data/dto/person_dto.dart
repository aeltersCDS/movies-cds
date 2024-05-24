import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/data/dto/movie_dto.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/person.dart';

part 'person_dto.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@ApiDateConverter()
class PersonDto {
  PersonDto({
    required this.id,
    required this.name,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
  });

  int id;
  String name;
  double popularity;
  int gender;
  String? knownForDepartment;
  String? profilePath;
  List<MovieDto> knownFor;

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);

  Person toDomain() => Person(
        id: id,
        name: name,
        popularity: popularity,
        gender: gender,
        knownForDepartment: knownForDepartment,
        profileUrl:
            profilePath != null ? "${Api.imagesBaseUrl}$profilePath" : null,
        knownFor: knownFor.map((movie) => movie.toDomain()).toList(),
      );
}
