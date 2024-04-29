import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:movie_app/pages/staff_list_page.dart';
import 'package:movie_app/theme/colors.dart'; 

void main() {
  runApp(MoviePage());
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rise of the Planet of the Apes'),
          backgroundColor: primaryColor, 
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrailerButton(
                trailerLink: 'https://youtu.be/P1yKN0llkrY?si=WLVd9vjfXmExY9US',
              ),
              Description(
                description: 'A substance designed to help the brain repair itself gives advanced intelligence to a chimpanzee who leads an ape uprising. A substance designed to help the brain repair itself gives advanced intelligence to a chimpanzee who leads an ape uprising.',
                time: '2h 12min',
                publicationDate: '2011',
                director: 'Rupert Wyatt',
              ),
              SizedBox(height: 20), 
              ButtonList(), 
              StaffListButton(),
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
            style: ElevatedButton.styleFrom(
            ),
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
  final String director;

  Description({
    required this.description,
    required this.time,
    required this.publicationDate,
    required this.director,
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
              color: primaryColor, // Using primaryColor from colors.dart
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
class StaffListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StaffListPage()),
        );
      },
      child: Text('Staff List'),
      style: ElevatedButton.styleFrom(
      ),
    );
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
      style: ElevatedButton.styleFrom(
      ),
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
      style: ElevatedButton.styleFrom(
      ),
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
      style: ElevatedButton.styleFrom(
      ),
    );
  }
}
