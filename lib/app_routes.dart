import 'package:go_router/go_router.dart';
import 'package:popular_movies/src/presenter/screens/details/details_screen.dart';
import 'package:popular_movies/src/presenter/screens/home/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomePage.name,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/movie/:id',
    builder: (context, state) {
      final movieId = state.pathParameters['id'] ?? 'no-id';
      return MoviePage(movieId: movieId);
    },
  )
]);
