import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/movie_cast_crew_page.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/movie_cast_crew_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_cast_crew_view_model.g.dart';

@riverpod
class MovieCastCrewViewModel extends _$MovieCastCrewViewModel {
  @override
  MovieCastCrewPageState build() {
    return const MovieCastCrewPageState();
  }

  void initWithData(MovieCastCrewData data) {
    state = state.copyWith(
      title: data.movie.title,
      cast: data.credits.cast,
      crew: data.credits.crew,
    );
  }
}
