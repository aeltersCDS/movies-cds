import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/domain/usecase/get_popular_movies.dart';
import 'package:movies_cds/layers/presentation/pages/movies/movies_page_state.dart';
import 'package:movies_cds/layers/presentation/providers.dart';

final moviesViewModelProvider =
    StateNotifierProvider<MoviesViewModel, MoviesPageState>((ref) {
  return MoviesViewModel(
      getPopularMoviesUseCase: ref.read(getPopularMoviesProvider));
});

class MoviesViewModel extends StateNotifier<MoviesPageState> {
  final GetPopularMovies _getPopularMoviesUseCase;

  MoviesViewModel({
    required GetPopularMovies getPopularMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(const MoviesPageState());

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd || state.status == MoviesPageStatus.loading) return;
    state = state.copyWith(status: MoviesPageStatus.loading);
    try {
      final page = await _getPopularMoviesUseCase(page: state.currentPage);
      state = state.copyWith(
        status: MoviesPageStatus.success,
        currentPage: state.currentPage + 1,
        movies: List.of(state.movies)..addAll(page),
        hasReachedEnd: page.isEmpty,
      );
    } catch (exc) {
      debugPrint("Error");
      state = state.copyWith(status: MoviesPageStatus.failure);
    }
  }
}
