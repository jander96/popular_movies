import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/domain/uses_cases/get_popular_movie.dart';
import 'package:popular_movies/src/presenter/screens/home/home_state.dart';

import '../../../di/injector.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  final GetPopularMovies _getPopularMovies;
  int _currentPage = 1;
  bool _loadingNextPage = false;
  HomeViewModel()
      : _getPopularMovies = injector.get<GetPopularMovies>(),
        super(const HomeViewState()) {
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    _getPopularMovies(page: _currentPage).then((movies) {
      emit(state.copyWith(
          isLoading: false, movies: [...state.movies, ...movies], error: null));
    }).onError((Exception error, _) {
      emit(state.copyWith(error: error, isLoading: false));
    });
  }

  Future<void> nextPage() async {
    if (_loadingNextPage) return;
    _loadingNextPage = true;
    _currentPage++;
    await _loadMovies();
    _loadingNextPage = false;
  }
}
