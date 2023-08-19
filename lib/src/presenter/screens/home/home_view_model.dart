import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/domain/uses_cases/get_popular_movie.dart';
import 'package:popular_movies/src/presenter/screens/home/home_state.dart';
import '../../../di/injector.dart';
import '../../../domain/models/result.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  final GetPopularMovies _getPopularMovies;
  int _currentPage = 1;
  bool _loadingNextPage = false;

  HomeViewModel()
      : _getPopularMovies = injector.get<GetPopularMovies>(),
        super(const HomeViewState()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getPopularMovies(page: _currentPage);
    switch (result) {
      case Success():
        emit(state.copyWith(
            isLoading: false,
            movies: [...state.movies, ...result.value],
            error: null));
      case Failure():
        emit(state.copyWith(error: result.exception, isLoading: false));
      case Loading():
        emit(state.copyWith(isLoading: true));
    }
  }

  Future<void> nextPage() async {
    if (_loadingNextPage) return;
    _loadingNextPage = true;
    _currentPage++;
    await loadMovies();
    _loadingNextPage = false;
  }
}
