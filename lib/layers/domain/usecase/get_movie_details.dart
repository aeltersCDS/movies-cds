import 'package:movies_cds/layers/domain/model/movie_details.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';

class GetMovieDetails {
  GetMovieDetails({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<MovieDetails> call(int movieId) async {
    final movie = _repository.getMovie(movieId);
    final credits = _repository.getMovieCredits(movieId);
    return MovieDetails(
      movie: await movie,
      credits: await credits,
    );
  }
}
