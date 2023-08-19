import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/di/injector.dart';
import 'package:popular_movies/src/domain/uses_cases/get_movie_byid.dart';
import 'package:popular_movies/src/presenter/screens/details/details_state.dart';

import '../../../domain/models/result.dart';

class DetailsViewModel extends Cubit<DetailViewState> {
  final GetMovieById _getMovieById;
  final int movieId;
  DetailsViewModel(this.movieId)
      : _getMovieById = injector.get<GetMovieById>(),
        super(const DetailViewState()) {
    loadMovie();
  }

  Future<void> loadMovie()async {
    emit(state.copyWith(isLoading: true));
    final result = await _getMovieById(movieId);
    switch(result){
      case Success(): emit(state.copyWith(isLoading: false, movie: result.value , error: null));
      case Failure(): emit(state.copyWith(error: result.exception, isLoading: false));
      case Loading(): emit(state.copyWith(isLoading: true));
    }
  }
}
