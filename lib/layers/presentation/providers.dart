import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/data/repository/movie_repository_impl.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';
import 'package:movies_cds/layers/domain/usecase/get_popular_movies.dart';

// -----------------------------------------------------------------------------
// Presentation
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Domain
// -----------------------------------------------------------------------------

final movieRepositoryProvider =
    Provider<MovieRepository>((ref) => MovieRepositoryImpl(
          api: ref.read(apiProvider),
        ));

final getPopularMoviesProvider =
    Provider<GetPopularMovies>((ref) => GetPopularMovies(
          repository: ref.read(movieRepositoryProvider),
        ));

// -----------------------------------------------------------------------------
// Data
// -----------------------------------------------------------------------------
final apiProvider = Provider<Api>(
  (ref) => ApiImpl(),
);
