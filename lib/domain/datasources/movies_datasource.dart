import 'package:cinema_pedia/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpComming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}
