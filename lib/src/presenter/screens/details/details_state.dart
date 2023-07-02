import 'package:equatable/equatable.dart';
import 'package:popular_movies/src/domain/models/movie.dart';

class DetailViewState extends Equatable {
  final bool isLoading;
  final Exception? error;
  final Movie? movie;

  const DetailViewState({this.isLoading = true, this.error, this.movie});

  DetailViewState copyWith({bool? isLoading, Exception? error, Movie? movie}) =>
      DetailViewState(
          isLoading: isLoading ?? this.isLoading, error: error, movie: movie);

  @override
  List<Object?> get props => [isLoading, error, movie];
}
