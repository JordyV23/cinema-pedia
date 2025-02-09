import 'package:dio/dio.dart';

import 'package:cinema_pedia/config/constants/environment.dart';
import 'package:cinema_pedia/domain/datasources/movies_datasource.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:cinema_pedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinema_pedia/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'es-MX'
      }
    )
  );


  List<Movie> _jsonToMovies(Map<String,dynamic> json){

    final movieDbResponse = MovieDbResponse.fromJson(json);

    return movieDbResponse.results
    .where((movieDb) => movieDb.posterPath != 'no-poster')
    .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
    .toList();


  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters:  {'page':page});

    return _jsonToMovies(response.data);

  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters:  {'page':page});
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters:  {'page':page});
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpComming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters:  {'page':page});
    return _jsonToMovies(response.data);
  }
}
