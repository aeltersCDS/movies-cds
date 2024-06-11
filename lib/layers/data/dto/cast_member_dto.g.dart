// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMemberDto _$CastMemberDtoFromJson(Map<String, dynamic> json) =>
    CastMemberDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CastMemberDtoToJson(CastMemberDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'character': instance.character,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile_path', instance.profilePath);
  return val;
}
