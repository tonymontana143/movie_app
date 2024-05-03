import 'package:flutter/material.dart';
import 'package:movie_app/pages/actor_and_staff_page.dart';

import '../models/staff.dart';

class StaffListPage extends StatefulWidget {
  const StaffListPage({
    super.key
  });

  @override
  State<StaffListPage> createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  List<StaffModel> staff = [
    StaffModel(name: "Rupert", surname: "Wyatt", position: "Director", imgUrl: "https://static.kinoafisha.info/k/persons/1080x1920/upload/persons/591518401587.jpg"),
    StaffModel(name: "Rick", surname: "Jaffa", position: "Writer", imgUrl: "https://in.bmscdn.com/iedb/artist/images/website/poster/large/rick-jaffa-1063444-07-07-2017-12-08-07.jpg"),
    StaffModel(name: "Amanda", surname: "Silver", position: "Writer", imgUrl: "https://avatars.sched.co/8/85/6105967/avatar.jpg?1d5"),
    StaffModel(name: "Pierre", surname: "Boulle", position: "Writer", imgUrl: "https://cdn.futura-sciences.com/sources/images/Pierre-Boule%20recadr%C3%A9.jpg"),
    StaffModel(name: "Peter", surname: "Chernin", position: "Producer", imgUrl: "https://pbs.twimg.com/profile_images/2842271663/7a998c1ca5401663f3a8ff06205c4c9e_400x400.png"),
    StaffModel(name: "Dylan", surname: "Clark", position: "Producer", imgUrl: "https://i0.wp.com/www.thewrap.com/wp-content/uploads/2017/07/dylan-1.jpg?fit=618%2C412&ssl=1"),
    StaffModel(name: "Thomas", surname: "M. Hammel", position: "Executive Producer", imgUrl: "https://assets-in.bmscdn.com/iedb/artist/images/website/poster/large/thomas-m.-hammel-iein012446-28-06-2019-12-42-37.jpg"),
    StaffModel(name: "Mike", surname: "Larocca", position: "Producer", imgUrl: "https://m.media-amazon.com/images/M/MV5BZTRkYTdmOTItZTU5MS00Y2NkLTlkNmMtOGUzOWY3MTM5ODc2XkEyXkFqcGdeQXVyMjc1NDE4Njg@._V1_QL75_UX140_CR0,1,140,207_.jpg"),
    StaffModel(name: "Kurt", surname: "Williams", position: "Co-Producer", imgUrl: "https://m.media-amazon.com/images/M/MV5BYWMzYWIxZGItYWE5Yi00MjNjLWE3N2QtMmEwZTkyOTRmNDljXkEyXkFqcGdeQXVyOTg4MDQwMzQ@._V1_QL75_UY207_CR7,0,140,207_.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Staff")
      ),
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
                  )
                );
              },
              child: StaffCard(
                  staffName: staff[index].name,
                  staffSurname: staff[index].surname,
                  position: staff[index].position,
                  imgUrl: staff[index].imgUrl
              ),
            );
          }
      ),
    );
  }
}

class StaffCard extends StatelessWidget {
  final String staffName;
  final String staffSurname;
  final String position;
  final String imgUrl;

  const StaffCard({
    super.key,
    required this.staffName,
    required this.staffSurname,
    required this.position,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imgUrl),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$staffName $staffSurname",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    position,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
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
