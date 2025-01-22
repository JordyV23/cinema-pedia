import 'package:cinema_pedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinema_pedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este reposotorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
