import 'package:flutter/material.dart';

class StaffModel {
  final String name;
  final String surname;
  final String position;
  final String imgUrl;
  bool showDetails;

  StaffModel({
    required this.name,
    required this.surname,
    required this.position,
    required this.imgUrl,
    this.showDetails = false,
  });
}

class StaffListPage extends StatefulWidget {
  const StaffListPage({
    super.key,
  });

  @override
  State<StaffListPage> createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  List<StaffModel> staff = [
    StaffModel(
      name: "Rupert",
      surname: "Wyatt",
      position: "Director",
      imgUrl:
          "https://static.kinoafisha.info/k/persons/1080x1920/upload/persons/591518401587.jpg",
      showDetails: false,
    ),
    StaffModel(
      name: "Rick",
      surname: "Jaffa",
      position: "Writer",
      imgUrl:
          "https://in.bmscdn.com/iedb/artist/images/website/poster/large/rick-jaffa-1063444-07-07-2017-12-08-07.jpg",
      showDetails: false,
    ),
    StaffModel(
      name: "Amanda",
      surname: "Silver",
      position: "Writer",
      imgUrl:
          "https://avatars.sched.co/8/85/6105967/avatar.jpg?1d5",
      showDetails: false,
    ),
    StaffModel(
      name: "Pierre",
      surname: "Boulle",
      position: "Writer",
      imgUrl:
          "https://cdn.futura-sciences.com/sources/images/Pierre-Boule%20recadr%C3%A9.jpg",
      showDetails: false,
    ),
    StaffModel(
      name: "Peter",
      surname: "Chernin",
      position: "Producer",
      imgUrl:
          "https://pbs.twimg.com/profile_images/2842271663/7a998c1ca5401663f3a8ff06205c4c9e_400x400.png",
      showDetails: false,
    ),
    StaffModel(
      name: "Dylan",
      surname: "Clark",
      position: "Producer",
      imgUrl:
          "https://i0.wp.com/www.thewrap.com/wp-content/uploads/2017/07/dylan-1.jpg?fit=618%2C412&ssl=1",
      showDetails: false,
    ),
    StaffModel(
      name: "Thomas M.",
      surname: "Hammel",
      position: "Executive Producer",
      imgUrl:
          "https://assets-in.bmscdn.com/iedb/artist/images/website/poster/large/thomas-m.-hammel-iein012446-28-06-2019-12-42-37.jpg",
      showDetails: false,
    ),
    StaffModel(
      name: "Mike",
      surname: "Larocca",
      position: "Producer",
      imgUrl:
          "https://m.media-amazon.com/images/M/MV5BZTRkYTdmOTItZTU5MS00Y2NkLTlkNmMtOGUzOWY3MTM5ODc2XkEyXkFqcGdeQXVyMjc1NDE4Njg@._V1_QL75_UX140_CR0,1,140,207_.jpg",
      showDetails: false,
    ),
    StaffModel(
      name: "Kurt",
      surname: "Williams",
      position: "Co-Producer",
      imgUrl:
          "https://m.media-amazon.com/images/M/MV5BYWMzYWIxZGItYWE5Yi00MjNjLWE3N2QtMmEwZTkyOTRmNDljXkEyXkFqcGdeQXVyOTg4MDQwMzQ@._V1_QL75_UY207_CR7,0,140,207_.jpg",
      showDetails: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff", style: TextStyle(fontFamily: "Poppins")),
      ),
      body: ListView.builder(
        itemCount: staff.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              StaffCard(
                staff: staff[index],
                onTap: () {
                  setState(() {
                    staff[index].showDetails = !staff[index].showDetails;
                  });
                },
              ),
              if (staff[index].showDetails)
                StaffDetailsPanel(
                  staff: staff[index],
                ),
            ],
          );
        },
      ),
    );
  }
}

class StaffCard extends StatelessWidget {
  final StaffModel staff;
  final VoidCallback onTap;

  const StaffCard({
    super.key,
    required this.staff,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(staff.imgUrl),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${staff.name} ${staff.surname}",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      staff.position,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaffDetailsPanel extends StatelessWidget {
  final StaffModel staff;

  // ignore: use_super_parameters
  const StaffDetailsPanel({
    Key? key,
    required this.staff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              getStaffInfo(staff),
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getStaffInfo(StaffModel staff) {
    switch (staff.name) {
      case "Rupert":
        return "Rupert Wyatt is a British film director and screenwriter. He is best known for directing the films 'Rise of the Planet of the Apes' and 'The Gambler'.";
      case "Rick":
        return "Rick Jaffa is an American screenwriter and producer. He is known for co-writing the screenplay for 'Rise of the Planet of the Apes' along with his wife Amanda Silver.";
      case "Amanda":
        return "Amanda Silver is an American screenwriter and producer. She is known for co-writing the screenplay for 'Rise of the Planet of the Apes' along with her husband Rick Jaffa.";
      case "Pierre":
        return "Pierre Boulle was a French novelist known for writing the novel 'La Planète des Singes' ('Planet of the Apes'), which served as the basis for the 'Planet of the Apes' film series.";
      case "Peter":
        return "Peter Chernin is an American businessman and film producer. He is the former president and COO of News Corporation and founder of The Chernin Group.";
      case "Dylan":
        return "Dylan Clark is an American film producer. He is known for producing films such as 'Dawn of the Planet of the Apes' and 'War for the Planet of the Apes'.";
      case "Thomas M.":
        return "Thomas M. Hammel is an American film producer and executive. He has served as an executive producer on various films, including 'Rise of the Planet of the Apes'.";
      case "Mike":
        return "Mike Larocca is an American film producer. He has worked on several successful films, including 'The Wolverine' and 'Dawn of the Planet of the Apes'.";
      case "Kurt":
        return "Kurt Williams is an American film producer. He is known for his work as a co-producer on films such as 'The Martian' and 'War for the Planet of the Apes'.";
      default:
        return "No additional information available.";
    }
  }
}


void main() {
  runApp(const MaterialApp(
    home: StaffListPage(),
  ));
}
