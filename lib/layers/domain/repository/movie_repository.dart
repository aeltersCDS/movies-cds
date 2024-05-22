import 'package:movies_cds/layers/domain/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 0});
}
