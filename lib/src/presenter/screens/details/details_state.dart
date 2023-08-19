import 'package:equatable/equatable.dart';
import 'package:popular_movies/src/domain/models/exceptions.dart';
import 'package:popular_movies/src/domain/models/movie.dart';

class DetailViewState extends Equatable {
  final bool isLoading;
  final AppException? error;
  final Movie? movie;

  const DetailViewState({this.isLoading = true, this.error, this.movie});

  DetailViewState copyWith({bool? isLoading, AppException? error, Movie? movie}) =>
      DetailViewState(
          isLoading: isLoading ?? this.isLoading, error: error, movie: movie);

  @override
  List<Object?> get props => [isLoading, error, movie];
}
