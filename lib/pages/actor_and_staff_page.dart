import "package:flutter/material.dart";

class ActorStaffPage extends StatelessWidget {
  final String actorName;
  final String actorSurname;
  final String actorRole;
  final String imgUrl;

  // ignore: use_super_parameters
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Biography: Andrew Clement Serkis (born 20 April 1964) is an English actor and filmmaker. He is best known for his motion-capture roles comprising motion capture acting, animation and voice work for computer-generated characters such as Gollum in The Lord of the Rings film trilogy (2001–2003) and The Hobbit: An Unexpected Journey (2012), King Kong in the eponymous 2005 film, Caesar in the Planet of the Apes reboot trilogy (2011–2017), Captain Haddock / Sir Francis Haddock in Steven Spielberg's The Adventures of Tintin (2011), Baloo in his self-directed film Mowgli: Legend of the Jungle (2018) and Supreme Leader Snoke in the Star Wars sequel trilogy films The Force Awakens (2015) and The Last Jedi (2017), also portraying Kino Loy in the Star Wars Disney+ series Andor (2022). ",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Birth Date: January 1, 1985",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Nationality: USA",
                  style: TextStyle(
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
