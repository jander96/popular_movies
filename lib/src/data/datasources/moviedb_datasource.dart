import 'package:popular_movies/src/data/models/mappers/movie_mapper.dart';
import 'package:popular_movies/src/data/remote/movie_api.dart';
import 'package:popular_movies/src/domain/models/movie.dart';

import '../../domain/datasources/movies_datasource.dart';

class MovieDbDatasource extends RemoteMovieDatasource {
  MovieDbDatasource(this.api);
  final ApiService api;
  @override
  Future<Movie> getMovieById(int movieId) {
    return api
        .getMovieById(movieId)
        .then((movie) => MovieMapper.movieDbToEntity(movie));
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return api.getPopularMovies(page: page).then((movieList) {
      final List<Movie> movies = movieList
          .where((moviedb) => moviedb.posterPath != 'no-poster')
          .map((e) => MovieMapper.movieDbToEntity(e))
          .toList();
      return movies;
    });
  }
}