import 'package:flutter/material.dart';
import 'package:movie_app/model/constants.dart';
import 'package:movie_app/model/movie_structure.dart';

class AddMovieScreen extends StatefulWidget {
  //final List<MovieStructure> movieList;
  const AddMovieScreen({
    Key? key,
    //required this.movieList,
  }) : super(key: key);

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  String movie = '';
  String director = '';
  String image = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 30),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Movie Name'),
                  maxLines: 1,
                  onChanged: (value) {
                    movie = value;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  maxLines: 1,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Director Name'),
                  onChanged: (value) {
                    director = value;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  maxLines: 1,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Image URL'),
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   widget.movieList.add(
                    var movieItem = MovieStructure(
                      movie: movie,
                      director: director,
                      image: image,
                    );
                    //   );
                    // });

                    Navigator.pop(context, movieItem);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "SAVE",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
