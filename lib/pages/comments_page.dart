import 'package:flutter/material.dart';
import 'package:movie_app/widgets/review_widget.dart'; 
class CommentsListPage extends StatelessWidget {
  const CommentsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewWidget(
              name: 'John Doe',
              avatarUrl: 'https://example.com/avatar.jpg',
              reviewText: 'Great movie! Highly recommended.',
              starsOutOfFive: 5,
            ),
            ReviewWidget(
              name: 'Jane Smith',
              avatarUrl: 'https://example.com/avatar.jpg',
              reviewText: 'Average movie. Could be better.',
              starsOutOfFive: 3,
            ),
            // ReviewWidget(
            //   name: 'Alice Johnson',
            //   avatarUrl: 'https://example.com/avatar.jpg',
            //   reviewText: 'Disappointing. Expected more.',
            //   starsOutOfFive: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
