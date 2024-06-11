import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class MovieDetailPageState extends Equatable {
  const MovieDetailPageState({
    this.status = PageStatus.initial,
    this.movie,
    this.credits,
  });

  final PageStatus status;
  final Movie? movie;
  final MovieCredits? credits;

  MovieDetailPageState copyWith({
    PageStatus? status,
    Movie? movie,
    MovieCredits? credits,
  }) {
    return MovieDetailPageState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      credits: credits ?? this.credits,
    );
  }

  @override
  List<Object?> get props => [status, movie, credits];
}
