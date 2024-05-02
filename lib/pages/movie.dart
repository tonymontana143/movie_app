import 'package:flutter/material.dart';
import 'package:movie_app/pages/actors_list_page.dart';
import 'package:movie_app/pages/comments_page.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:movie_app/pages/stuff_list_page.dart';
import 'package:movie_app/theme/colors.dart'; 

void main() {
  runApp(const MoviePage());
}

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Planet of the Apes'),
        ),
        body: const SingleChildScrollView(
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

  const TrailerButton({super.key, required this.trailerLink});

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
            style: ElevatedButton.styleFrom(
            ),
            child: const Text('Watch Trailer'),
          ),
        ],
      ),
    );
  }
}
class ActorWidget extends StatelessWidget {
  final String imageAsset;
  final String name;

  const ActorWidget({super.key, required this.imageAsset, required this.name});

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
        const SizedBox(height: 5),
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

  const Description({super.key, 
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
          const SizedBox(height: 10),
          Text('Duration: $time'),
          Text('Publication Date: $publicationDate'),
        ],
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class StaffListButton extends StatelessWidget {
  const StaffListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StuffListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
      ),
      child: const Text('Staff List'),
    );
  }
}

class ActorsListButton extends StatelessWidget {
  const ActorsListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ActorsListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
      ),
      child: const Text('Actors List'),
    );
  }
}

class NewsListButton extends StatelessWidget {
  const NewsListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const  NewsListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
      ),
      child: const Text('News List'),
    );
  }
}

class CommentsListButton extends StatelessWidget {
  const CommentsListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CommentsListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
      ),
      child: const Text('Comments List'),
    );
  }
}
