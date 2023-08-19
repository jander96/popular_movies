
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_api_model.g.dart';
part 'movie_api_model.freezed.dart';

@freezed
class MovieMovieDB with _$MovieMovieDB {
    factory MovieMovieDB({
        bool? adult,
        @JsonKey(name: 'backdrop_path')
        String? backdropPath,
        @JsonKey(name: 'genre_ids')
        List<int>? genreIds,
        int? id,
        @JsonKey(name: 'original_language')
        String? originalLanguage,
        @JsonKey(name: 'original_title')
        String? originalTitle,
        String ?overview,
        double? popularity,
        @JsonKey(name: 'poster_path')
        String? posterPath,
        @JsonKey(name: 'release_date')
        DateTime? releaseDate,
        String? title,
        bool? video,
        @JsonKey(name: 'vote_average')
        double? voteAverage,
        @JsonKey(name: 'vote_count')
        int? voteCount,
}) = _MovieMovieDB;

    factory MovieMovieDB.fromJson(Map<String, dynamic> json) => _$MovieMovieDBFromJson(json);

    factory MovieMovieDB.fromJsonIndividual(Map<String, dynamic> json) => MovieMovieDB(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? "",
        genreIds: List<int>.from(json["genres"].map((map) => map['id'])),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"] ?? "",
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? "",
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );
}

