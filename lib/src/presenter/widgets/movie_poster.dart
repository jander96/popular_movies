import 'package:flutter/material.dart';

import '../../domain/models/movie.dart';


class MovieListView extends StatelessWidget {
 
  final List<Movie> movies;
  final VoidCallback? onTap;
  const MovieListView(
      {super.key, required this.movies, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: movies.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
      return _Poster(movie: movies[index]);
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class _Poster extends StatelessWidget {
  final Movie movie;
  const _Poster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return child;
                  
                },
              ),
            ),
          ),
          const SizedBox(
           height: 5,
          ),

          SizedBox(
            width: 150,
            child: Text(movie.title),
          )
        ],
      ),
    );
  }
}
