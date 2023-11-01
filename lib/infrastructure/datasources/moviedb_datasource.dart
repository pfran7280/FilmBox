import 'package:dio/dio.dart';

import 'package:filmbox/config/constants/environment.dart';
import 'package:filmbox/domain/datasources/movies_datasource.dart';

import 'package:filmbox/domain/entities/movie.dart';
import 'package:filmbox/infrastructure/mappers/movie_mapper.dart';
import 'package:filmbox/infrastructure/models/moviedb/moviedb_response.dart';



class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {'api_key': Environment.theMovieDbKey}
    )
  );

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
}
