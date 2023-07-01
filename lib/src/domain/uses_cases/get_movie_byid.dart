import 'package:popular_movies/src/domain/repositories/movies_repository.dart';

import '../models/movie.dart';

class GetMovieById {
  GetMovieById(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<Movie> call(int movieId) {
    return _movieRepository.getMovieById(movieId);
  }
}
