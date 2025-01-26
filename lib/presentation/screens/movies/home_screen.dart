import 'package:flutter/material.dart'; 

import 'package:cinema_pedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinema_pedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoviews = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMoviews.length == 0) return const CircularProgressIndicator();

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideShow(movies: nowPlayingMoviews)



        // Expanded(
        //   child: ListView.builder(
        //       itemCount: nowPlayingMoviews.length,
        //       itemBuilder: (context, index) {
        //         final movie = nowPlayingMoviews[index];
        //         return ListTile(
        //           title: Text(movie.title),
        //         );
        //       }),
        // )
      ],
    );
  }
}
