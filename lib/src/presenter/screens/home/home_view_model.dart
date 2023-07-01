import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/domain/uses_cases/get_popular_movie.dart';
import 'package:popular_movies/src/presenter/screens/home/home_state.dart';

import '../../../di/injector.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  final GetPopularMovies _getPopularMovies;
  HomeViewModel()
      : _getPopularMovies = injector.get<GetPopularMovies>(),
        super(const HomeViewState()) {
    _loadMovies();
  }

  void _loadMovies({int page = 1}) {
    emit(state.copyWith(isLoading: true));

    _getPopularMovies(page: page).then((movies) {
      emit(state.copyWith(isLoading: false, movies: movies));
    }).onError((Exception error, _) {
      emit(state.copyWith(error: error, isLoading: false));
    });
  }
}
