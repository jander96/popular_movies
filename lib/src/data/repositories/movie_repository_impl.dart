import 'package:popular_movies/src/domain/models/movie.dart';
import 'package:popular_movies/src/domain/repositories/movies_repository.dart';

import '../../domain/datasources/movies_datasource.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(this._datasource);
  final RemoteMovieDatasource _datasource;

  @override
  Future<Movie> getMovieById(int movieId) {
    return _datasource.getMovieById(movieId);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return _datasource.getPopularMovies(page: page);
  }
}
