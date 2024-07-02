import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_detail/movie_detail_page_state.dart';
import 'package:movies_cds/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model.g.dart';

@riverpod
class MovieDetailViewModel extends _$MovieDetailViewModel {
  @override
  MovieDetailPageState build() {
    return const MovieDetailPageState();
  }

  void initWithMovie(Movie movie) {
    state = state.copyWith(movie: movie);
    _loadDetails(movie.id);
  }

  void _loadDetails(int movieId) async {
    final details = await ref.read(getMovieDetailsProvider)(movieId);
    state = state.copyWith(
      movie: details.movie,
      credits: details.credits,
    );
  }
}
