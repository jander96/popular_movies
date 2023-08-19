import 'package:popular_movies/src/domain/repositories/movies_repository.dart';

import '../models/exceptions.dart';
import '../models/movie.dart';
import '../models/result.dart';

class GetMovieById {
  GetMovieById(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<Result<Movie,AppException>> call(int movieId) {
    return _movieRepository.getMovieById(movieId);
  }
}
