import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';

enum MoviesPageStatus { initial, loading, success, failure }

class MoviesPageState extends Equatable {
  const MoviesPageState({
    this.status = MoviesPageStatus.initial,
    this.movies = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final MoviesPageStatus status;
  final List<Movie> movies;
  final bool hasReachedEnd;
  final int currentPage;

  MoviesPageState copyWith({
    MoviesPageStatus? status,
    List<Movie>? movies,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return MoviesPageState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        movies,
        hasReachedEnd,
        currentPage,
      ];
}
