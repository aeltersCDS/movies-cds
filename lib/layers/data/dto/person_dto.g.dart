// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'popularity': instance.popularity,
    'gender': instance.gender,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('known_for_department', instance.knownForDepartment);
  writeNotNull('profile_path', instance.profilePath);
  val['known_for'] = instance.knownFor.map((e) => e.toJson()).toList();
  return val;
}
