import 'package:popular_movies/src/domain/models/movie.dart';

abstract class RemoteMovieDatasource {
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<Movie> getMovieById(int movieId);
}
