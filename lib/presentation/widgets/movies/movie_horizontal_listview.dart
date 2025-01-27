import 'package:animate_do/animate_do.dart';
import 'package:cinema_pedia/config/helpers/human_formats.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  
  const MovieHorizontalListview({
    super.key, 
    required this.movies,
    this.loadNextPage,
    this.subTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if(title != null || subTitle != null)
          _Title(title: title, subTitle: subTitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder:(context,index) => _Slide(movie: movies[index]),
            )
          )
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SlideImage(movie: movie),

          const SizedBox(height: 5),

          //* Titulo
          _SliceMovieTitle(movie:movie,textStyles: textStyles),

          //* Rating
          _SliceMovieRating(movie:movie, textStyles:textStyles)    
        ],
      ),
    );
  }
}

class _SliceMovieRating extends StatelessWidget {
  
  final Movie movie;
  final TextTheme textStyles;
  
  const _SliceMovieRating({
    required this.movie, 
    required this.textStyles
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_outlined, color: Colors.amberAccent.shade700),
          const SizedBox(width: 3),
          Text('${movie.voteAverage}',
            style: textStyles.bodyMedium?.copyWith(color: Colors.amberAccent.shade700),
          ),
          const SizedBox(width: 10),
          Spacer(),
          Icon(Icons.thumb_up_outlined, size: 16,),
          const SizedBox(width: 3),
          Text(HumanFormats.number(movie.popularity), style: textStyles.bodySmall )
        ],
      ),
    );
  }
}

class _SliceMovieTitle extends StatelessWidget {
  
  final Movie movie;
  final TextTheme textStyles;

  const _SliceMovieTitle({required this.movie, required this.textStyles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Text(
        movie.title, 
        maxLines: 2,
        style: textStyles.titleSmall,
      ),
    );
  }
}

class _SlideImage extends StatelessWidget {
 final Movie movie;
 const _SlideImage({required this.movie});

 @override
 Widget build(BuildContext context) {
   return SizedBox(
     width: 150,
     child: ClipRRect(
       borderRadius: BorderRadius.circular(20),
       child: Image.network(
         movie.posterPath,
         fit: BoxFit.cover,
         width: 150,
         loadingBuilder: (context, child, loadingProgress) {
           if (loadingProgress != null) {
             return const Padding(
               padding: EdgeInsets.all(8.0),
               child: Center(
                 child: CircularProgressIndicator(),
               ),
             );
           }
           return FadeIn(child: child);
         },
       ),
     ),
   );
 }
}

class _Title extends StatelessWidget {
  
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title != null)
          Icon(Icons.theaters_outlined), 
          Text( title!, style: titleStyle),
          const Spacer(),
          if(subTitle != null) 
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: (){}, 
            child: Text(subTitle!)
          ),
        ],
      ),
    );
  }
}