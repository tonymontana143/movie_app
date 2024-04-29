import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActorsListPage()),
            );
          },
          child: const Text('Actors List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewsListPage()),
            );
          },
          child: const Text('News List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CommentsListPage()),
            );
          },
          child: const Text('Comments List'),
        ),
      ],
    );
  }
}
