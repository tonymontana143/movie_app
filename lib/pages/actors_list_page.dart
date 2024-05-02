import 'package:flutter/material.dart';
import 'package:movie_app/models/actors.dart';
import 'package:movie_app/pages/actor_page.dart';

class ActorsListPage extends StatefulWidget {
  const ActorsListPage({super.key});

  @override
  State<ActorsListPage> createState() => _ActorsListPageState();
}

class _ActorsListPageState extends State<ActorsListPage> {
  List<ActorModel> actors = [
    ActorModel(name: "Andy", surname: "Serkis", role: "Caesar", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/3/3c/Andy_Serkis_Photo_Op_GalaxyCon_Austin_2023.jpg"),
    ActorModel(name: "Karin", surname: "Konoval", role: "Maurice / Court Clerk", imgUrl: "https://m.media-amazon.com/images/M/MV5BMDBlZDgzZTEtOTAzMC00YmRmLWJjMmUtYWEwMmVjMzhkYTk1XkEyXkFqcGdeQXVyMjE4MTQ3MzQ@._V1_.jpg"),
    ActorModel(name: "Terry", surname: "Notary", role: "Rocket / Bright Eyes", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Terry_Notary_2018_%28cropped%29.jpg/220px-Terry_Notary_2018_%28cropped%29.jpg"),
    ActorModel(name: "Richard", surname: "Ridings", role: "Buck - Ape", imgUrl: "https://m.media-amazon.com/images/M/MV5BMjBmYmE3MDAtOTdjNC00OWIzLWFhMTYtM2QxMDgwYmNiYTU1XkEyXkFqcGdeQXVyMTU3MzMzMTU@._V1_.jpg"),
    ActorModel(name: "Christopher", surname: "Gordon", role: "Koba - Ape", imgUrl: "https://media.themoviedb.org/t/p/w235_and_h235_face/x3yZlw5ZqSCT4RWNdt7VxVmJgMh.jpg"),
    ActorModel(name: "Devyn", surname: "Dalton", role: "Cornelia - Ape", imgUrl: "https://m.media-amazon.com/images/M/MV5BZjgyMzhjMDYtMDUwMi00MmYzLThmMGUtYjUwZDJiN2FhODc4XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg"),
    ActorModel(name: "Jay", surname: "Caputo", role: "Alpha", imgUrl: "https://m.media-amazon.com/images/M/MV5BODgyNTMwMzUxMl5BMl5BanBnXkFtZTcwMjA2MDgyNg@@._V1_.jpg"),
    ActorModel(name: "James", surname: "Franco", role: "Will Rodman", imgUrl: "https://m.media-amazon.com/images/M/MV5BMjA4MzMzNDM5MF5BMl5BanBnXkFtZTgwMjQ0MDk0NDM@._V1_FMjpg_UX1000_.jpg"),
    ActorModel(name: "Freida", surname: "Pinto", role: "Caroline Aranha", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Freida_Pinto_-_Youth_For_Change_%28cropped%29.jpg/1200px-Freida_Pinto_-_Youth_For_Change_%28cropped%29.jpg"),
    ActorModel(name: "John", surname: "Lithgow", role: "Charles Rodman", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/52/John_Lithgow_at_Met_Opera_Opening_in_2008.jpg"),
    ActorModel(name: "Brian", surname: "Cox", role: "John Landon", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/2/2d/Brian_Cox_%282016%29_-_01.jpg"),
    ActorModel(name: "Tom", surname: "Felton", role: "Dodge Landon", imgUrl: "https://static.independent.co.uk/2022/10/10/10/newFile-6.jpg"),
    ActorModel(name: "David", surname: "Oyelowo", role: "Steven Jacobs", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/8/81/David_Oyelowo_Golden_Globes.jpg"),
    ActorModel(name: "Tyler", surname: "Labine", role: "Robert Franklin", imgUrl: "https://m.media-amazon.com/images/M/MV5BMjk5OWIzNGItODgyNy00ODZkLThiMDktOGY3NTlmNzdlNmY1XkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_.jpg"),
    ActorModel(name: "Jamie", surname: "Harris", role: "Rodney - Shelter Assistant", imgUrl: "https://i.mydramalist.com/rBNb7_5c.jpg"),
    ActorModel(name: "Ty", surname: "Olsson", role: "Chief John Hamil", imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Ty_Olsson.jpg/800px-Ty_Olsson.jpg"),
    ActorModel(name: "David", surname: "Hewlett", role: "Hunsiker", imgUrl: "https://m.media-amazon.com/images/M/MV5BMGQ5NjhhZTMtMTNkZS00OTcyLWE4NDctMTQ2ZDYxYjU1MDQwXkEyXkFqcGdeQXVyMDE2ODExOA@@._V1_.jpg"),
    ActorModel(name: "Joey", surname: "Roche", role: "Todd Hunsiker", imgUrl: "https://m.media-amazon.com/images/M/MV5BMzE4MDEzODIyMF5BMl5BanBnXkFtZTcwMzY5MDYzMQ@@._V1_.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cast"),
      ),
      body: ListView.builder(
        itemCount: actors.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActorPage(
                    actorName: actors[index].name,
                    actorSurname: actors[index].surname,
                    actorRole: actors[index].role,
                    imgUrl: actors[index].imgUrl)
                )
              );
            },
              child: ActorInfoBox(
                  index: index + 1,
                  actorName: actors[index].name,
                  actorSurname: actors[index].surname,
                  actorRole: actors[index].role,
                  actorImg: actors[index].imgUrl
              )
          );
        },
      ),
    );
  }
}

class ActorInfoBox extends StatelessWidget {
  final int index;
  final String actorName;
  final String actorSurname;
  final String actorRole;
  final String actorImg;

  const ActorInfoBox({
    super.key,
    required this.index,
    required this.actorName,
    required this.actorSurname,
    required this.actorRole,
    required this.actorImg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
      child: Row(
        children: [
          Text(
            "$index",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Image.network(
              actorImg,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text("Failed to load the image!");
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
      ),
    );
  }
}
