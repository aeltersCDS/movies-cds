import 'package:movies_cds/layers/domain/model/movie_credits.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class GetMovieCredits {
  GetMovieCredits({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<MovieCredits> call(int movieId) async {
    final credits = await _repository.getMovieCredits(movieId);
    return credits;
  }
}
