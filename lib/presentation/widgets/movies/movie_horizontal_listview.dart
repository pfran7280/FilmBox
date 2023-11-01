import 'package:animate_do/animate_do.dart';
import 'package:filmbox/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(
              title: title,
              subTitle: subTitle,
            ),
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _Slide(movie: movies[index]);
                  }))
        ],
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
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
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
          //* Image
          SizedBox(
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
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          //* Tittle

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              style: textStyles.titleSmall,
              maxLines: 2,
            ),
          ),

          //* Rating

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
                const SizedBox(width: 3,),
                Text('${movie.voteAverage}', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800),),
                const Spacer(),
                Text(HumanFormats.number(movie.popularity), style: textStyles.bodySmall,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
