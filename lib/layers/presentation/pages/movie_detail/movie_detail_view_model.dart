import 'package:logger/logger.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
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

  void hideErrorDialog() {
    state = state.copyWith(status: PageStatus.success);
  }

  void _loadDetails(int movieId) async {
    state = state.copyWith(status: PageStatus.loading);
    try {
      final details = await ref.read(getMovieDetailsProvider)(movieId);
      state = state.copyWith(
        status: PageStatus.success,
        movie: details.movie,
        credits: details.credits,
      );
    } catch (exc, stack) {
      Logger().e(exc, stackTrace: stack);
      state = state.copyWith(status: PageStatus.failure);
    }
  }
}
