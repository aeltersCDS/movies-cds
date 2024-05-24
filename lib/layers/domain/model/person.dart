import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';

class Person with EquatableMixin {
  Person({
    required this.id,
    required this.name,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profileUrl,
    required this.knownFor,
  });

  int id;
  String name;
  double popularity;
  int gender;
  String? knownForDepartment;
  String? profileUrl;
  List<Movie>? knownFor;

  @override
  List<Object?> get props => [
        id,
        name,
        popularity,
        gender,
        knownForDepartment,
        profileUrl,
        knownFor,
      ];
}
