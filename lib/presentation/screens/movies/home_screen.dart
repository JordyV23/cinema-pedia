import 'package:cinema_pedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart'; 
import 'package:cinema_pedia/presentation/widgets/widgets.dart';
import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
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
    final nowPlayingMoviesSlide = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          title: CustomAppbar(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate( (context, index) {
            return 
            Column(
              children: [
                MoviesSlideShow(movies: nowPlayingMoviesSlide),
                MovieHorizontalListview(
                  movies: nowPlayingMoviews,
                  title: 'En Cines',
                  subTitle:HumanFormats.dayNameMonthNumber(),
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMoviews,
                  title: 'Próximamente',
                  subTitle:'En este Mes',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMoviews,
                  title: 'Populares',
                  subTitle:HumanFormats.dayNameMonthNumber(),
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(height: 10,)
              ],
            );
          }, childCount: 1 )
        )
      ]
    );
  }
}
