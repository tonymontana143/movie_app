import 'package:flutter/material.dart';
import 'pages/movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet of the Apes',
      home: MoviePage(),
    );
  }
}
