import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movies_cds/layers/data/repository/movie_repository_impl.dart';
import 'package:movies_cds/layers/data/repository/person_repository_impl.dart';
import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/data/source/remote/request_interceptor.dart';
import 'package:movies_cds/layers/domain/repository/movie_repository.dart';
import 'package:movies_cds/layers/domain/repository/person_repository.dart';
import 'package:movies_cds/layers/domain/usecase/get_popular_movies.dart';
import 'package:movies_cds/layers/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_cds/layers/domain/usecase/get_trending_people.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// -----------------------------------------------------------------------------
// Presentation
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Domain
// -----------------------------------------------------------------------------

@Riverpod(keepAlive: true)
MovieRepository movieRepository(MovieRepositoryRef ref) => MovieRepositoryImpl(
      api: ref.read(apiProvider),
    );

@Riverpod(keepAlive: true)
PersonRepository personRepository(PersonRepositoryRef ref) =>
    PersonRepositoryImpl(
      api: ref.read(apiProvider),
    );

@Riverpod(keepAlive: true)
GetPopularMovies getPopularMovies(GetPopularMoviesRef ref) => GetPopularMovies(
      repository: ref.read(movieRepositoryProvider),
    );

@Riverpod(keepAlive: true)
GetTopRatedMovies getTopRatedMovies(GetTopRatedMoviesRef ref) =>
    GetTopRatedMovies(
      repository: ref.read(movieRepositoryProvider),
    );

@Riverpod(keepAlive: true)
GetTrendingPeople getTrendingPeople(GetTrendingPeopleRef ref) =>
    GetTrendingPeople(
      repository: ref.read(personRepositoryProvider),
    );

// -----------------------------------------------------------------------------
// Data
// -----------------------------------------------------------------------------

@Riverpod(keepAlive: true)
MoviesRestInterceptor moviesRestInterceptor(MoviesRestInterceptorRef ref) =>
    MoviesRestInterceptor(logger: ref.read(loggerProvider));

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/",
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30)))
  ..interceptors.addAll([ref.read(moviesRestInterceptorProvider)]);

@Riverpod(keepAlive: true)
Api api(ApiRef ref) => ApiImpl(dio: ref.read(dioProvider));

// -----------------------------------------------------------------------------
// General
// -----------------------------------------------------------------------------
@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger();
