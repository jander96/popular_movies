import 'package:flutter/material.dart';
import 'package:popular_movies/src/di/injector.dart';

import 'app_routes.dart';

void main() {
  setupInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Popular Movies App',
    );
  }
}
