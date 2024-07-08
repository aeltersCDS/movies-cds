// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:movies_cds/layers/data/dto/movie_credits_dto.dart';
import 'package:movies_cds/layers/data/dto/movie_dto.dart';
import 'package:movies_cds/layers/data/dto/person_dto.dart';

abstract class Api {
  Future<List<MovieDto>> loadPopularMovies({int page = 0});
  Future<List<MovieDto>> loadTopRatedMovies({int page = 0});
  Future<List<PersonDto>> loadTrendingPeople({int page = 0});
  Future<MovieCreditsDto> loadMovieCredits(int movieId);
  Future<MovieDto> loadMovieDetails(int movieId);
  Future<PersonDto> loadPersonDetails(int personId);
  static const imagesBaseUrl = "https://image.tmdb.org/t/p/original/";
}

class ApiImpl implements Api {
  final Dio _dio;

  ApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<MovieDto>> loadPopularMovies({int page = 0}) async {
    final Response<Map<String, dynamic>> response = await _dio.get(
      'discover/movie',
      queryParameters: {
        "include_video": false,
        "page": page,
        "sort_by": "popularity.desc"
      },
    );
    final list = (response.data!['results'] as List<dynamic>)
        .map((e) => MovieDto.fromJson(e))
        .toList();
    return list;
  }

  @override
  Future<List<MovieDto>> loadTopRatedMovies({int page = 0}) async {
    final Response<Map<String, dynamic>> response = await _dio.get(
      'movie/top_rated',
      queryParameters: {
        "include_video": false,
        "page": page,
      },
    );
    final list = (response.data!['results'] as List<dynamic>)
        .map((e) => MovieDto.fromJson(e))
        .toList();
    return list;
  }

  @override
  Future<List<PersonDto>> loadTrendingPeople({int page = 0}) async {
    final Response<Map<String, dynamic>> response = await _dio.get(
      'trending/person/day',
      queryParameters: {
        "page": page,
      },
    );
    final list = (response.data!['results'] as List<dynamic>)
        .map((e) => PersonDto.fromJson(e))
        .toList();
    return list;
  }

  @override
  Future<MovieCreditsDto> loadMovieCredits(int movieId) async {
    final Response<Map<String, dynamic>> response =
        await _dio.get('movie/$movieId/credits');
    final credits = MovieCreditsDto.fromJson(response.data!);
    return credits;
  }

  @override
  Future<MovieDto> loadMovieDetails(int movieId) async {
    final Response<Map<String, dynamic>> response =
        await _dio.get('movie/$movieId');
    final movie = MovieDto.fromJson(response.data!);
    return movie;
  }

  @override
  Future<PersonDto> loadPersonDetails(int personId) async {
    final Response<Map<String, dynamic>> response =
        await _dio.get('person/$personId');
    final person = PersonDto.fromJson(response.data!);
    return person;
  }
}
