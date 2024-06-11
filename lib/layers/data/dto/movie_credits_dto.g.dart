// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditsDto _$MovieCreditsDtoFromJson(Map<String, dynamic> json) =>
    MovieCreditsDto(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastMemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewMemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditsDtoToJson(MovieCreditsDto instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };
