import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Api _api;

  MovieRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final movies = await _api.loadPopularMovies(page: page);
    return movies.map((movie) => movie.toDomain()).toList();
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final movies = await _api.loadTopRatedMovies(page: page);
    return movies.map((movie) => movie.toDomain()).toList();
  }

  @override
  Future<Movie> getMovie(int movieId) async {
    final movie = await _api.loadMovieDetails(movieId);
    return movie.toDomain();
  }

  @override
  Future<MovieCredits> getMovieCredits(int movieId) async {
    final credits = await _api.loadMovieCredits(movieId);
    return credits.toDomain();
  }
}
