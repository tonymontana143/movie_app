import 'package:flutter/material.dart';
import 'package:movie_app/widgets/pop_up_dialog.dart';

import 'actor_and_staff_page.dart';

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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => const PopUpDialog(type: "Staff")
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff", style: TextStyle(fontFamily: "Poppins")),
      ),
      backgroundColor: const Color(0xFF000000),
      body: ListView.builder(
        itemCount: staff.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActorStaffPage(
                      actorName: staff[index].name,
                      actorSurname: staff[index].surname,
                      actorRole: staff[index].position,
                      imgUrl: staff[index].imgUrl,
                    ),
                  ),
                );
              },
              child: StaffCard(staff: staff[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add), // Optional: Customize the button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Optional: Customize the button position
    );
  }
}

class StaffCard extends StatelessWidget {
  final StaffModel staff;

  const StaffCard({
    super.key,
    required this.staff
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color(0xFF000000),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
                      color: Color(0xFFC7C8CC)
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
    );
  }
}
