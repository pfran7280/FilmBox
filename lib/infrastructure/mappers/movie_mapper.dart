import 'package:filmbox/infrastructure/models/moviedb/movie_moviedb.dart';

import '../../domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: ( moviedb.backdropPath != '' ) 
      ? 'https://image.tmdb.org/t/p/original${ moviedb.backdropPath }'
      : 'https://th.bing.com/th/id/R.0c0b85f24b1d0392a387b7cb89f0e99f?rik=df%2bNhtV%2fiwz88A&pid=ImgRaw&r=0',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath:( moviedb.posterPath != '' )
      ? 'https://image.tmdb.org/t/p/original${ moviedb.posterPath }'
      : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );
}
