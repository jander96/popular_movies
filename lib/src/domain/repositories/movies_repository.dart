import '../models/exceptions.dart';
import '../models/movie.dart';
import '../models/result.dart';

abstract class MovieRepository{
  Future<Result<List<Movie>,AppException>> getPopularMovies({int page = 1});
  Future<Result<Movie,AppException>> getMovieById(int movieId);
}