// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_api_model.dart';

part 'moviedb_response.g.dart';
part 'moviedb_response.freezed.dart';

@freezed
class MovieDbResponse with _$MovieDbResponse {
    factory MovieDbResponse({
      int? page,
      List<MovieMovieDB>? results,
      @JsonKey(name: 'total_page')
      int? totalPages,
      @JsonKey(name: 'total_result')
      int? totalResults,
}) = _MovieDbResponse;

    factory MovieDbResponse.fromJson(Map<String, dynamic> json) => _$MovieDbResponseFromJson(json);
}



