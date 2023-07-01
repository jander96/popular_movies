import 'package:get_it/get_it.dart';
import 'package:popular_movies/src/data/datasources/moviedb_datasource.dart';
import 'package:popular_movies/src/data/repositories/movie_repository_impl.dart';

import '../data/remote/movie_api.dart';
import '../domain/datasources/movies_datasource.dart';
import '../domain/repositories/movies_repository.dart';
import '../domain/uses_cases/get_movie_byid.dart';
import '../domain/uses_cases/get_popular_movie.dart';

final injector = GetIt.instance;

void setupInjector() {

  injector.registerSingleton<ApiService>(ApiService());
  final api = injector.get<ApiService>();

  injector.registerSingleton<RemoteMovieDatasource>(MovieDbDatasource(api));
  final datasource = injector.get<RemoteMovieDatasource>();

  injector.registerSingleton<MovieRepository>(MovieRepositoryImpl(datasource));
  final repository = injector.get<MovieRepository>();

  injector.registerFactory<GetPopularMovies>(()=> GetPopularMovies(repository));
  
  
  injector.registerFactory<GetMovieById>(()=>GetMovieById(repository));
  final getMovieByIdUseCase = injector.get<GetMovieById>();
}
