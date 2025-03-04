import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {

  final List<Movie> movies;


  const MoviesSlideShow({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 310,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        itemBuilder: (context,index) => _Slide(movie: movies[index]),
        itemCount: movies.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          ),
          margin: const EdgeInsets.only(top: 0)
        ),
        scale: 0.9,
        viewportFraction: 0.8,
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10) 
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgess) {
              if ( loadingProgess != null) {
                return _ImageSkeleton();
              }

              return FadeIn(child: child);
            },
          )
        )
      ),
    );
  }
}

class _ImageSkeleton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.5), 
      duration: const Duration(milliseconds: 1000), 
      builder: (context, value, child){
        return Opacity(
          opacity: 0.5 + (0.5 * sin(value * 3.14 * 2)),
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.black12),
          ), 
        );
      }
    );
  }
}