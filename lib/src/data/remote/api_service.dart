import 'package:popular_movies/src/data/models/moviedb_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../constants/constants.dart';
import '../models/movie_api_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: MovieDbConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(MovieDbConstants.popularPath)
  Future<MovieDbResponse> getPopularMovies(
      {@Query(MovieDbConstants.queryParameterPage) int page = 1});

  @GET(MovieDbConstants.movieDetail)
  Future<MovieMovieDB> getResponse(@Path('id')int movieId);
}
