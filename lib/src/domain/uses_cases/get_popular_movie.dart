import 'package:popular_movies/src/domain/models/movie.dart';
import 'package:popular_movies/src/domain/repositories/movies_repository.dart';

import '../models/exceptions.dart';
import '../models/result.dart';

class GetPopularMovies {
  GetPopularMovies(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<Result<List<Movie>,AppException>> call({int page = 1}) {
    return _movieRepository.getPopularMovies(page: page);
  }
}
