// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:movies_cds/layers/data/dto/movie_dto.dart';
import 'package:movies_cds/layers/data/source/remote/request_interceptor.dart';

abstract class Api {
  Future<List<MovieDto>> loadPopularMovies({int page = 0});
}

class ApiImpl implements Api {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)))
    ..interceptors.addAll([MoviesRestInterceptor()]);

  @override
  Future<List<MovieDto>> loadPopularMovies({int page = 0}) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
          'discover/movie?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc');
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
}
