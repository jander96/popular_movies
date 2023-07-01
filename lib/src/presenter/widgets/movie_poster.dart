import 'package:flutter/material.dart';

import '../../domain/models/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;
  final VoidCallback? onTap;
  const MovieListView({super.key, required this.movies, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return _ItemView(movie: movies[index]);
      },
    );
  }
}

class _ItemView extends StatelessWidget {
  final Movie movie;
  const _ItemView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [_Image(movie), Expanded(child: _Overview(movie))],
      )),
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
          Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 4,),
          Row(
            children: [
              const Icon(Icons.star_half, color: Colors.amber,),
              const SizedBox(width: 4,),
              Text(movie.voteAverage.toString()),
            ],
          ),
          Text(movie.overview,maxLines: 3, overflow: TextOverflow.ellipsis,textAlign: TextAlign.justify ,style: TextStyle(fontWeight: FontWeight.w300),)

        ],
      ),
    );
  }
}
