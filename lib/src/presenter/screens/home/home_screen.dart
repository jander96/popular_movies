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
        create: (BuildContext context) => HomeViewModel(),
        child: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewModel>().state;
    final viewModel = context.read<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Movie App")),
      body: SafeArea(
        child:
            Padding(padding: const EdgeInsets.all(8.0), child: render(state,viewModel)),
      ),
    );
  }

  Widget render(HomeViewState state, HomeViewModel viewModel) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      if (state.error != null) {
        return const Center(
            child: Column(
          children: [Icon(Icons.error), Text("Connection error ")],
        ));
      } else {
        return MovieListView(
          movies: state.movies,
          loadNextPage: viewModel.nextPage,
        );
      }
    }
  }
}
