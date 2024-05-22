import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class GetPopularMovies {
  GetPopularMovies({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<List<Movie>> call({int page = 0}) async {
    final list = await _repository.getPopularMovies(page: page);
    return list;
  }
}
