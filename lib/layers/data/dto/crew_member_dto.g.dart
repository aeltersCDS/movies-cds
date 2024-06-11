// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMemberDto _$CrewMemberDtoFromJson(Map<String, dynamic> json) =>
    CrewMemberDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      job: json['job'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CrewMemberDtoToJson(CrewMemberDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'job': instance.job,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile_path', instance.profilePath);
  return val;
}
