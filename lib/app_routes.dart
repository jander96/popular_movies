import 'package:go_router/go_router.dart';
import 'package:popular_movies/src/presenter/screens/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),

      )
  ]);
