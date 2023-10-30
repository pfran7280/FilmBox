import 'package:filmbox/infrastructure/datasources/moviedb_datasource.dart';
import 'package:filmbox/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this repository is inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
