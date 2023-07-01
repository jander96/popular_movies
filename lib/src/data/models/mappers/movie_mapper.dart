
import '../../../domain/models/movie.dart';
import '../movie_api_model.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://th.bing.com/th/id/R.2ebfe3fcf82a4c6ccac494de2306a357?rik=nhacddg%2fGR3P3A&pid=ImgRaw&r=0',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
