import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class MoviesPageState extends Equatable {
  const MoviesPageState({
    this.status = PageStatus.initial,
    this.movies = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final PageStatus status;
  final List<Movie> movies;
  final bool hasReachedEnd;
  final int currentPage;

  MoviesPageState copyWith({
    PageStatus? status,
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
