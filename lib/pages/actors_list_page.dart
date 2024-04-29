import 'package:flutter/material.dart';

class ActorsListPage extends StatelessWidget {
  const ActorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actors List'),
      ),
      body: ListView(
        children: const [
          ActorInfoBox(
            actorName: "Name",
            actorSurname: "Surname",
            actorRole: "MC",
            actorImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGdbO5phR6v83bdnceeNl4fI5s0jQkQqRu3vzOR6cSQ&s",
          ),
          ActorInfoBox(
            actorName: "Name",
            actorSurname: "Surname",
            actorRole: "MC",
            actorImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGdbO5phR6v83bdnceeNl4fI5s0jQkQqRu3vzOR6cSQ&s",
          ),
          ActorInfoBox(
            actorName: "Name",
            actorSurname: "Surname",
            actorRole: "MC",
            actorImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGdbO5phR6v83bdnceeNl4fI5s0jQkQqRu3vzOR6cSQ&s",
          ),
          ActorInfoBox(
            actorName: "Name",
            actorSurname: "Surname",
            actorRole: "MC",
            actorImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGdbO5phR6v83bdnceeNl4fI5s0jQkQqRu3vzOR6cSQ&s",
          ),
        ],
      ),
    );
  }
}

class ActorInfoBox extends StatelessWidget {
  final String actorName;
  final String actorSurname;
  final String actorRole;
  final String actorImg;

  const ActorInfoBox({
    super.key,
    required this.actorName,
    required this.actorSurname,
    required this.actorRole,
    required this.actorImg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0, left: 15.0),
          child: Image.network(
            actorImg,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Placeholder or error message when image fails to load
              return const Placeholder();
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$actorName $actorSurname",
              style: const TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
            Text(
              actorRole,
              style: const TextStyle(color: Color(0xFF212121)),
            ),
          ],
        ),
      ],
    );
  }
}
