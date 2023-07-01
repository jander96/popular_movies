import '../models/movie.dart';

abstract class MovieRepository{
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<Movie> getMovieById(int movieId);
}