import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class MovieDetailPageState extends Equatable {
  const MovieDetailPageState({
    this.status = PageStatus.initial,
    this.movie,
    this.cast = const [],
  });

  final PageStatus status;
  final Movie? movie;
  final List<Person>? cast;

  MovieDetailPageState copyWith({
    PageStatus? status,
    Movie? movie,
    List<Person>? cast,
  }) {
    return MovieDetailPageState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      cast: cast ?? this.cast,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movie,
      ];
}
