import 'package:flutter/material.dart';
import 'package:movie_app/news/news_list.dart';
import 'package:movie_app/cast/cast_list_page.dart';
import 'package:movie_app/comments/comments_page.dart';

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
              MaterialPageRoute(builder: (context) =>  CastListPage()),
            );
          },
          child: const Text('Actors List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  NewssListPage()),
            );
          },
          child: const Text('News List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentsPage()),
            );
          },
          child: const Text('Comments List'),
        ),
      ],
    );
  }
}
