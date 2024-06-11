import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/cast_member.dart';
import 'package:movies_cds/layers/domain/model/crew_member.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class MovieCastCrewPageState extends Equatable {
  const MovieCastCrewPageState({
    this.status = PageStatus.initial,
    this.title = "",
    this.cast = const [],
    this.crew = const [],
  });

  final PageStatus status;
  final String title;
  final List<CastMember>? cast;
  final List<CrewMember>? crew;

  MovieCastCrewPageState copyWith({
    PageStatus? status,
    String? title,
    List<CastMember>? cast,
    List<CrewMember>? crew,
  }) {
    return MovieCastCrewPageState(
      title: title ?? this.title,
      status: status ?? this.status,
      cast: cast ?? this.cast,
      crew: crew ?? this.crew,
    );
  }

  @override
  List<Object?> get props => [status, title, cast, crew];
}
