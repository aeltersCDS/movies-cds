import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class GetTopRatedMovies {
  GetTopRatedMovies({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<List<Movie>> call({int page = 0}) async {
    final list = await _repository.getTopRatedMovies(page: page);
    return list;
  }
}