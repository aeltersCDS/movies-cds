import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/person.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> getTopRatedMovies({int page = 1});
  // TODO: Change this to cast member and crew members.
  Future<List<Person>> getMovieCast(int movieId);
}
