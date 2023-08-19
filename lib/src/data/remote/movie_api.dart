//
// import 'package:dio/dio.dart';
// import 'package:popular_movies/src/data/constants/constants.dart';
// import 'package:popular_movies/src/data/models/moviedb_response.dart';
//
// import '../models/movie_api_model.dart';
//
// class ApiService {
//   final dio =
//       Dio(BaseOptions(baseUrl: MovieDbConstants.baseUrl, queryParameters: {
//     MovieDbConstants.queryParameterApiKey: MovieDbConstants.apiKey,
//     MovieDbConstants.queryParameterLanguaje: MovieDbConstants.defaultLanguaje
//   }));
//
//   Future<List<MovieMovieDB>> getPopularMovies({int page = 1}) async {
//     try {
//       final response = await dio.get(MovieDbConstants.popularPath,
//           queryParameters: {MovieDbConstants.queryParameterPage: page});
//
//       final movieDbResponse = MovieDbResponse.fromJson(response.data);
//       final List<MovieMovieDB> movies = movieDbResponse.results;
//
//       return movies;
//     } on Exception catch (e) {
//       return Future.error(e);
//     }
//   }
//
//   Future<MovieMovieDB> getMovieById(int movieId) async {
//     try {
//       final response = await dio.get(MovieDbConstants.movieDetail);
//       final MovieMovieDB movie = MovieMovieDB.fromJsonIndividual(response.data);
//       return movie;
//     } on Exception catch (e) {
//       return Future.error(e);
//     }
//   }
// }
