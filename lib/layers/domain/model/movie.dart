import 'package:equatable/equatable.dart';

class Movie with EquatableMixin {
  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});

  int id;
  String title;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
