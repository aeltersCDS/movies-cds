import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class GetMovieCast {
  GetMovieCast({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<List<Person>> call(int movieId) async {
    final cast = await _repository.getMovieCast(movieId);
    return cast;
  }
}
