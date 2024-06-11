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
  static const imagesBaseUrl = "https://image.tmdb.org/t/p/original/";
}

class ApiImpl implements Api {
  final Dio _dio;

  ApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<MovieDto>> loadPopularMovies({int page = 0}) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.get(
          'discover/movie?include_video=false&language=en-US&page=$page&sort_by=popularity.desc');
      final list = (response.data!['results'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e))
          .toList();
      return list;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<MovieDto>> loadTopRatedMovies({int page = 0}) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .get('movie/top_rated?include_video=false&language=en-US&page=$page');
      final list = (response.data!['results'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e))
          .toList();
      return list;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<PersonDto>> loadTrendingPeople({int page = 0}) async {
    try {
      final Response<Map<String, dynamic>> response =
          await _dio.get('trending/person/day?language=en-US&page=$page');
      final list = (response.data!['results'] as List<dynamic>)
          .map((e) => PersonDto.fromJson(e))
          .toList();
      return list;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
    }

    return [];
  }

  @override
  Future<MovieCreditsDto> loadMovieCredits(int movieId) async {
    try {
      final Response<Map<String, dynamic>> response =
          await _dio.get('movie/$movieId/credits');
      final credits = MovieCreditsDto.fromJson(response.data!);
      return credits;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
      rethrow;
    }
  }
}
