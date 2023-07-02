import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/movie.dart';

class MovieListView extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? onTap;
  final VoidCallback? loadNextPage;
  const MovieListView(
      {super.key, required this.movies, this.onTap, this.loadNextPage});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (widget.loadNextPage == null) return;
      if (controller.position.pixels + 200 >=
          controller.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: widget.movies.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return _ItemView(movie: widget.movies[index]);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _ItemView extends StatelessWidget {
  final Movie movie;
  const _ItemView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: ()=> context.push("/movie/${movie.id}"),
        child: Card(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_Image(movie), Expanded(child: _Overview(movie))],
        )),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image(
    this.movie,
  );

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            image: NetworkImage(movie.posterPath),
            placeholder: const AssetImage("assets/images/loader.gif"),
            imageErrorBuilder: (_, __, ___) => Image.asset("assets/images/load_image_error.png"),
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
            height: 112,
          ),
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 4,
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
            ],
          ),
          Text(
            movie.overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
