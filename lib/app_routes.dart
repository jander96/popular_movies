import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popular_movies/src/presenter/screens/details/details_screen.dart';
import 'package:popular_movies/src/presenter/screens/favorites/favorites.dart';
import 'package:popular_movies/src/presenter/screens/home/home_screen.dart';
import 'nav_host.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();


final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return NavHost(navigationShell);
      },
      branches: [
        // The route branch for the 1º Tab
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          // Add this branch routes
          // each routes with its sub routes if available e.g feed/uuid/details
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              name: HomePage.name,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';
                    return MoviePage(movieId: movieId);
                  },
                )
              ]
            ),

          ],
        ),

        // The route branch for 2º Tab
        StatefulShellBranch(routes: <RouteBase>[
          // Add this branch routes
          // each routes with its sub routes if available e.g shope/uuid/details
          GoRoute(
            path: '/favorites',
            builder: (context, state) => const FavoritePage(),
          ),
        ])
      ],
    ),
  ],
);