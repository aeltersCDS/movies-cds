import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Api _api;

  MovieRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Movie>> getPopularMovies({int page = 0}) async {
    final movies = await _api.loadPopularMovies(page: page);
    return movies;
  }
}
