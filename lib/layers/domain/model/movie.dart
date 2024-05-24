import 'package:equatable/equatable.dart';

class Movie with EquatableMixin {
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterUrl,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  int id;
  String title;
  String overview;
  double popularity;
  String? posterUrl;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        popularity,
        posterUrl,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
