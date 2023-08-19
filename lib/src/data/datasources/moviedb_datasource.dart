import 'package:dio/dio.dart';
import 'package:popular_movies/src/common/dio_extensions.dart';
import 'package:popular_movies/src/domain/models/exceptions.dart';
import 'package:popular_movies/src/data/models/mappers/movie_mapper.dart';
import 'package:popular_movies/src/domain/models/movie.dart';

import '../../domain/datasources/movies_datasource.dart';
import '../../domain/models/result.dart';
import '../remote/api_service.dart';

class MovieDbDatasource extends RemoteMovieDatasource {
  MovieDbDatasource(this._api);

  final RestClient _api;

  @override
  Future<Result<Movie,AppException>> getMovieById(int movieId) async{
    try {
      final movieDb = await _api.getResponse(movieId);
      final movie = MovieMapper.toDomain(movieDb);
      return Success(movie);
    } catch (e) {
      final dioException = (e as DioException);
      return dioException.handlingError<Movie>();
    }
  }

  @override
  Future<Result<List<Movie>,AppException>> getPopularMovies({int page = 1})async {
    try {
      final response = await _api.getPopularMovies(page: page);
      final listOfMovie = response.results?.map((movieDb) => MovieMapper.toDomain(movieDb)).toList() ?? [];
      return Success(listOfMovie);
    } on Exception catch (e) {
      final dioException = (e as DioException);
      return dioException.handlingError<List<Movie>>();
    }
  }
}
