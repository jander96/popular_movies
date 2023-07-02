import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/di/injector.dart';
import 'package:popular_movies/src/domain/uses_cases/get_movie_byid.dart';
import 'package:popular_movies/src/presenter/screens/details/details_state.dart';

class DetailsViewModel extends Cubit<DetailViewState> {
  final GetMovieById _getMovieById;
  final int movieId;
  DetailsViewModel(this.movieId)
      : _getMovieById = injector.get<GetMovieById>(),
        super(const DetailViewState()) {
    loadMovie();
  }

  loadMovie() {
    emit(state.copyWith(isLoading: true));
    _getMovieById(movieId).then((movie) {
      emit(state.copyWith(isLoading: false, movie: movie, error: null));
    }).onError((Exception error, _) {
      emit(state.copyWith(error: error, isLoading: false));
    });
  }
}
