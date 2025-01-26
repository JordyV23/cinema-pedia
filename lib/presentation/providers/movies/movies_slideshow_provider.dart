
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinema_pedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';

final moviesSlideShowProvider = Provider<List<Movie>>( (ref) {

  final nowPlayingMoviews = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMoviews.isEmpty) return [];

  return nowPlayingMoviews.sublist(0,6);

});