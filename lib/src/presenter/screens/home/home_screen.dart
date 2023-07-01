import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/presenter/widgets/movie_poster.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  static const name = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeViewModel(), child: _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewModel>().state;
    
    return Scaffold(
      body: MovieListView(movies: state.movies),
    );
  }
}
