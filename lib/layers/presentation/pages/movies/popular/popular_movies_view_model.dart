import 'package:flutter/material.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/movies_page_state.dart';
import 'package:movies_cds/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_movies_view_model.g.dart';

@riverpod
class PopularMoviesViewModel extends _$PopularMoviesViewModel {
  @override
  MoviesPageState build() {
    return const MoviesPageState();
  }

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd || state.status == PageStatus.loading) return;
    state = state.copyWith(status: PageStatus.loading);
    try {
      final page =
          await ref.read(getPopularMoviesProvider)(page: state.currentPage);
      state = state.copyWith(
        status: PageStatus.success,
        currentPage: state.currentPage + 1,
        movies: List.of(state.movies)..addAll(page),
        hasReachedEnd: page.isEmpty,
      );
    } catch (exc) {
      debugPrint("Error");
      state = state.copyWith(status: PageStatus.failure);
    }
  }
}
