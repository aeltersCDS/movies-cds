import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/cast_member.dart';
import 'package:movies_cds/layers/domain/model/crew_member.dart';

class MovieCredits with EquatableMixin {
  MovieCredits({
    required this.cast,
    required this.crew,
  });

  List<CastMember> cast;
  List<CrewMember> crew;

  @override
  List<Object?> get props => [
        cast,
        crew,
      ];
}
