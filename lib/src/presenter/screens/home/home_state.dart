import 'package:equatable/equatable.dart';
import 'package:popular_movies/src/domain/models/exceptions.dart';

import '../../../domain/models/movie.dart';

class HomeViewState extends Equatable {
  final bool isLoading;
  final List<Movie> movies;
  final AppException? error;

  const HomeViewState(
      {this.isLoading = true, this.movies = const [], this.error});

  HomeViewState copyWith(
          {bool? isLoading, List<Movie>? movies, AppException? error}) =>
      HomeViewState(
          isLoading: isLoading ?? this.isLoading,
          movies: movies ?? this.movies,
          error: error);

  @override
  List<Object?> get props => [isLoading,movies,error];
}
