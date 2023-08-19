import 'package:popular_movies/src/domain/models/movie.dart';
import 'package:popular_movies/src/domain/repositories/movies_repository.dart';

import '../../domain/models/exceptions.dart';
import '../../domain/datasources/movies_datasource.dart';
import '../../domain/models/result.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(this._datasource);
  final RemoteMovieDatasource _datasource;

  @override
  Future<Result<Movie,AppException>> getMovieById(int movieId) {
    return _datasource.getMovieById(movieId);
  }

  @override
  Future<Result<List<Movie>,AppException>> getPopularMovies({int page = 1}) {
    return _datasource.getPopularMovies(page: page);
  }
}
