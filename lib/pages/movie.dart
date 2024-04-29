import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';
import 'package:movie_app/pages/news_list_page.dart';


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
              SizedBox(height: 20), // Added some spacing between description and buttons
              ButtonList(), // Added buttons here
              ActorsListButton(),
              NewsListButton(),
              CommentsListButton(),
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
              // Handle trailer button press
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


class ActorsListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActorsListPage()),
        );
      },
      child: Text('Actors List'),
    );
  }
}

class NewsListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsListPage()),
        );
      },
      child: Text('News List'),
    );
  }
}

class CommentsListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentsListPage()),
        );
      },
      child: Text('Comments List'),
    );
  }
}
