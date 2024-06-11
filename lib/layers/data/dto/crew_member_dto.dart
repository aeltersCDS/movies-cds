import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/crew_member.dart';

part 'crew_member_dto.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@ApiDateConverter()
class CrewMemberDto {
  CrewMemberDto({
    required this.id,
    required this.name,
    required this.job,
    required this.profilePath,
  });

  int id;
  String name;
  String job;
  String? profilePath;

  factory CrewMemberDto.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberDtoToJson(this);

  CrewMember toDomain() => CrewMember(
        id: id,
        name: name,
        job: job,
        profileUrl:
            profilePath != null ? "${Api.imagesBaseUrl}$profilePath" : null,
      );
}
