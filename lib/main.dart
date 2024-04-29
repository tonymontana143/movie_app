import 'package:flutter/material.dart';
import 'pages/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Planet of the Apes',
      home: MoviePage(),
    );
  }
}
