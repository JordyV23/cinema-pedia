import 'package:dio/dio.dart';

import 'package:cinema_pedia/config/constants/environment.dart';
import 'package:cinema_pedia/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';

class MoviedbDatasource extends MovieDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDBKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // ignore: unused_local_variable
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }
}
