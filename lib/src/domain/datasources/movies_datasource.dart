import 'package:popular_movies/src/domain/models/movie.dart';

import '../models/exceptions.dart';
import '../models/result.dart';

abstract class RemoteMovieDatasource {
  Future<Result<List<Movie>,AppException>> getPopularMovies({int page = 1});
  Future<Result<Movie,AppException>>  getMovieById(int movieId);
}
