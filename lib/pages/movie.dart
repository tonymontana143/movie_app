import 'package:flutter/material.dart';

void main() {
  runApp(MoviePage());
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Planet of the Apes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrailerButton(
                trailerLink: 'https://youtu.be/P1yKN0llkrY?si=WLVd9vjfXmExY9US',
              ),
              Description(
                description: 'In a dystopian world overrun by apes...',
                time: '2h 12min',
                publicationDate: 'April 29, 2024',
              ),
              ButtonList(),
              ActorsList(),
              NewsList(),
              CommentsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrailerButton extends StatelessWidget {
  final String trailerLink;

  TrailerButton({required this.trailerLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'images/movie_img.jpg', 
              width: 200, 
              height: 200, 
              fit: BoxFit.cover, 
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Watch Trailer'),
          ),
        ],
      ),
    );
  }
}


class Description extends StatelessWidget {
  final String description;
  final String time;
  final String publicationDate;

  Description({
    required this.description,
    required this.time,
    required this.publicationDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(description),
          SizedBox(height: 10),
          Text('Duration: $time'),
          Text('Publication Date: $publicationDate'),
        ],
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ActorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CommentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
