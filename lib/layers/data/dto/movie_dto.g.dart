// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: _$JsonConverterFromJson<String, DateTime>(
          json['release_date'], const ApiDateConverter().fromJson),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    )
      ..name = json['name'] as String?
      ..firstAirDate = _$JsonConverterFromJson<String, DateTime>(
          json['first_air_date'], const ApiDateConverter().fromJson)
      ..status = json['status'] as String?
      ..originalLanguage = json['original_language'] as String?
      ..runtime = (json['runtime'] as num?)?.toInt()
      ..budget = (json['budget'] as num?)?.toInt()
      ..revenue = (json['revenue'] as num?)?.toInt();

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('name', instance.name);
  val['overview'] = instance.overview;
  val['popularity'] = instance.popularity;
  writeNotNull('poster_path', instance.posterPath);
  writeNotNull(
      'release_date',
      _$JsonConverterToJson<String, DateTime>(
          instance.releaseDate, const ApiDateConverter().toJson));
  writeNotNull(
      'first_air_date',
      _$JsonConverterToJson<String, DateTime>(
          instance.firstAirDate, const ApiDateConverter().toJson));
  val['vote_average'] = instance.voteAverage;
  val['vote_count'] = instance.voteCount;
  writeNotNull('status', instance.status);
  writeNotNull('original_language', instance.originalLanguage);
  writeNotNull('runtime', instance.runtime);
  writeNotNull('budget', instance.budget);
  writeNotNull('revenue', instance.revenue);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
