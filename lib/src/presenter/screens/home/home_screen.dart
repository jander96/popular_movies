import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/presenter/screens/home/home_state.dart';
import 'package:popular_movies/src/presenter/widgets/movie_poster.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  static const name = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeViewModel(), child: const _HomeView());
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: render(state)
        ),
      ),
    );
  }

  Widget render(HomeViewState state){
    if (state.isLoading){
      return const Center(child: CircularProgressIndicator());
    }else{
      if (state.error != null) {
        return const Center(child: Column(
          children: [
            Icon(Icons.error),
            Text("Connection error ")
          ],
        ));
        }else{
          return MovieListView(movies: state.movies);
        }
    }
  }
}
