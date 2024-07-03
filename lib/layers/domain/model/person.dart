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
    required this.biography,
    required this.knownFor,
  });

  int id;
  String name;
  double popularity;
  int gender;
  String? knownForDepartment;
  String? profileUrl;
  String? biography;
  List<Movie>? knownFor;

  @override
  List<Object?> get props => [
        id,
        name,
        popularity,
        gender,
        knownForDepartment,
        profileUrl,
        biography,
        knownFor,
      ];

  Person copyWith({
    int? id,
    String? name,
    double? popularity,
    int? gender,
    String? knownForDepartment,
    String? profileUrl,
    String? biography,
    List<Movie>? knownFor,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      gender: gender ?? this.gender,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      profileUrl: profileUrl ?? this.profileUrl,
      biography: biography ?? this.biography,
      knownFor: knownFor ?? this.knownFor,
    );
  }
}
