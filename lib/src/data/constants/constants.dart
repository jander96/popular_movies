class MovieDbConstants {
  MovieDbConstants._();
  static const baseUrl = 'https://api.themoviedb.org/3';

  static const queryParameterApiKey = 'api_key';

  static const queryParameterPage = 'page';

  static const apiKey = '548f82996984bbd96d00735a0f2addbc';

  static const queryParameterLanguaje = 'language';

  static const defaultLanguaje = 'es-ES';

  static const popularPath = '/movie/popular';

  static String movieDetail(int id) => '/movie/$id';
}
