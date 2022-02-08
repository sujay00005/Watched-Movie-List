import 'package:flutter/material.dart';

class MovieTile extends StatefulWidget {
  final String movieName;
  final String director;
  final String posterImage;
  final Null Function() onPressed;

  const MovieTile({
    Key? key,
    required this.movieName,
    required this.director,
    required this.posterImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool imageFound = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: [
          Expanded(child: Image.asset(widget.posterImage, height: 250, width: 150, fit: BoxFit.contain)),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.movieName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    widget.director,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black26,
                    ),
                  ),
                  const SizedBox(height: 40),
                  IconButton(
                    onPressed: widget.onPressed,
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.redAccent[500],
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
