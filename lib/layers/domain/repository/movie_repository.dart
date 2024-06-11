import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> getTopRatedMovies({int page = 1});
  Future<MovieCredits> getMovieCredits(int movieId);
}
