import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/presenter/screens/details/details_state.dart';
import 'package:popular_movies/src/presenter/screens/details/details_view_model.dart';

import '../../../domain/models/movie.dart';

class MoviePage extends StatelessWidget {
  final String movieId;
  const MoviePage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: const _DetailsView(),
        create: (BuildContext context) => DetailsViewModel(int.parse(movieId)));
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailsViewModel>().state;
    final viewModel = context.read<DetailsViewModel>();

    return render(state, viewModel);
  }

  Widget render(DetailViewState state, DetailsViewModel viewModel) {
    if (state.error != null) {
      return Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              OutlinedButton(
                  onPressed: viewModel.loadMovie,
                  child: const Icon(Icons.replay_rounded)),
              Text(state.error?.message ?? '')
            ],
          )),
        ),
      );
    } else {
      if (state.isLoading || state.movie == null) {
        return const Center(
          child: Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      }
      return _SuccessView(movie: state.movie!);
    }
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MovieDetails(movie: movie),
                  childCount: 1))
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                ),
              ),

              const SizedBox(width: 10),

              // Descripción
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textStyles.titleLarge),
                    Text('(${movie.originalTitle})',
                        style: textStyles.titleSmall),
                    Text(movie.originalLanguage),
                    Text(movie.overview),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fecha de lanzamiento: ${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}',
                style: textStyles.titleSmall,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_half,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(movie.voteAverage.toString()),
                  const SizedBox(
                    width: 16,
                  ),
                  Text('votos: ${movie.voteCount}'),
                   const SizedBox(
                    width: 16,
                  ),
                  Text('popularidad: ${movie.popularity}')
                ],
              ),
              Text("Contenido solo para adultos: ${movie.adult ? 'Si': 'No'}")
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.5,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return child;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
