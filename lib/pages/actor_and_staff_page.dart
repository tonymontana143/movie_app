import "package:flutter/material.dart";

class ActorStaffPage extends StatelessWidget {
  final String actorName;
  final String actorSurname;
  final String actorRole;
  final String imgUrl;

  const ActorStaffPage({
    Key? key,
    required this.actorName,
    required this.actorSurname,
    required this.actorRole,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$actorName $actorSurname", style: const TextStyle(fontFamily: "Poppins")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            children: [
              Image.network(
                imgUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text("Failed to load the image!");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "$actorName $actorSurname",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  actorRole,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Biography: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id lectus a nulla pretium scelerisque. Donec efficitur fermentum ultricies.",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Birth Date: January 1, 1970",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Nationality: USA",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
