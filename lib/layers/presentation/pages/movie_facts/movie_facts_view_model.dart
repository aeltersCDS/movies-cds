import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_facts_view_model.g.dart';

@riverpod
class MovieFactsViewModel extends _$MovieFactsViewModel {
  @override
  MovieFactsPageState build() {
    return const MovieFactsPageState();
  }

  void initWithMovie(Movie movie) {
    state = state.copyWith(
      status: movie.status,
      releaseDate: movie.releaseDate,
      originalLanguage: movie.originalLanguage,
      runtime: movie.runtime,
      budget: movie.budget,
      revenue: movie.revenue,
    );
  }
}
