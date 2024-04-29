import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActorsListPage()),
            );
          },
          child: Text('Actors List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsListPage()),
            );
          },
          child: Text('News List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentsListPage()),
            );
          },
          child: Text('Comments List'),
        ),
      ],
    );
  }
}
