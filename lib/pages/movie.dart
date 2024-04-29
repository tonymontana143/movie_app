import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:movie_app/pages/stuff_list_page.dart';
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
          title: Text('Planet of the Apes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrailerButton(
                trailerLink: 'https://youtu.be/P1yKN0llkrY?si=WLVd9vjfXmExY9US',
              ),             
              SizedBox(height: 20), 
              ActorsListButton(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActorWidget(
                    imageAsset: 'images/james_franco.jpeg',
                    name: 'Actor 1',
                  ),
                  ActorWidget(
                    imageAsset: 'images/andy.jpeg',
                    name: 'Actor 2',
                  ),
                ],
              ),
           ButtonList(), 
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
class ActorWidget extends StatelessWidget {
  final String imageAsset;
  final String name;

  ActorWidget({required this.imageAsset, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageAsset,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 5),
        Text(name),
      ],
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
              color: primaryColor,
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
          MaterialPageRoute(builder: (context) => StuffListPage()),
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
