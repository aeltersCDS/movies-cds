import 'package:json_annotation/json_annotation.dart';
import 'package:movies_cds/layers/data/converter/api_date_converter.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/cast_member.dart';

part 'cast_member_dto.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@ApiDateConverter()
class CastMemberDto {
  CastMemberDto({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  int id;
  String name;
  String character;
  String? profilePath;

  factory CastMemberDto.fromJson(Map<String, dynamic> json) =>
      _$CastMemberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CastMemberDtoToJson(this);

  CastMember toDomain() => CastMember(
        id: id,
        name: name,
        character: character,
        profileUrl:
            profilePath != null ? "${Api.imagesBaseUrl}$profilePath" : null,
      );
}
