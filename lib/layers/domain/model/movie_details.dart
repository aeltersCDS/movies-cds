import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';

class MovieDetails with EquatableMixin {
  MovieDetails({
    required this.movie,
    required this.credits,
  });

  Movie movie;
  MovieCredits credits;

  @override
  List<Object?> get props => [
        movie,
        credits,
      ];
}
