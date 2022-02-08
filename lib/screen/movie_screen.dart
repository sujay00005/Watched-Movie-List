import 'package:flutter/material.dart';
import 'package:movie_app/screen/add_movie_screen.dart';
import 'package:movie_app/widget/movie_tile.dart';

import '../model/movie_structure.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<MovieStructure> movieList = [
    MovieStructure(
      movie: 'Spider-man',
      director: 'Jon Watts',
      image: 'images/spiderman.jpg',
    ),
    MovieStructure(
      movie: 'Avatar',
      director: 'James Cameron',
      image: 'images/avatar.jpg',
      //Image.asset('images/avatar.jpg'),
    ),
    MovieStructure(
      movie: 'Hotel- Transylvania',
      director: 'Jennifer Kluska',
      image: 'images/hotelTransylvania.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newMovie = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddMovieScreen();
              },
            ),
          );

          setState(() {
            movieList.add(newMovie);
          });
        },
        tooltip: 'Add Movie',
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: MovieTile(
              posterImage: movieList[index].image,
              movieName: movieList[index].movie,
              director: movieList[index].director,
              onPressed: () {
                setState(() {
                  movieList.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
