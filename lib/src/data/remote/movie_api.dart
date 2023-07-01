import 'package:dio/dio.dart';
import 'package:popular_movies/src/data/constants/constants.dart';

class ApiService {
  final dio =
      Dio(
        BaseOptions(
          baseUrl: MovieDbConstants.baseUrl, 
          queryParameters: {
            MovieDbConstants.queryParameterApiKey: MovieDbConstants.apiKey,
            MovieDbConstants.queryParameterLanguaje: MovieDbConstants.defaultLanguaje
  }));


}
