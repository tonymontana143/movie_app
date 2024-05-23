import 'package:flutter/material.dart';
import 'package:movie_app/cast/cast_list_page.dart';
import 'package:movie_app/events/event_list_page.dart';
import 'package:movie_app/comments/comments_page.dart';
import 'package:movie_app/new_news/news_page.dart';
import 'package:movie_app/staff/staff_list_page.dart';
import 'package:movie_app/widgets/trailer_button.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'dart:ui';

void main() {
  runApp(const MoviePage());
}

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Set the theme to dark
      home: Scaffold(
        backgroundColor: Colors.black, // Set the background color to black
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 260,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Image.asset(
                                'images/movie_img.jpg',
                                fit: BoxFit.cover,
                                opacity: const AlwaysStoppedAnimation(.7),
                              ),
                            ),
                          ),
                        ),
                        Padding(  
  padding: const EdgeInsets.all(8.0),
  child: Column(
    children: [
      const Text(
        'Rise of the Planet of the Apes',
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFFC7C8CC),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
          child: TrailerButton(
            trailerLink: 'https://www.youtube.com/watch?v=P1yKN0llkrY&t=4s',
          ),
        ),
      ),
    ],
  ),
),

                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), // Set the container shape
                        color: Colors.white.withOpacity(0.0), // Adjust the opacity to control the blur effect
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: Color(0xFFEEEEEE)
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                             padding: EdgeInsets.all(8.0),
                                 child: Text(
                                    'A substance designed to help the brain repair itself gives advanced intelligence to a chimpanzee who leads an ape uprising.', textAlign: TextAlign.center,
                                      style: TextStyle(
                                   fontFamily: "Poppins",
                                              fontSize: 16,
                                 color: Color(0xFFC7C8CC),
                                   ),
                                           ),
                                                      ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 5),
                              Text(
                                'Date:',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '11.08.2011',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(width: 5),
                                Text(
                                  'Length:',
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '105 min',
                                  style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const ActorsListButton(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActorWidget(imageAsset: 'images/james_franco.jpeg', name: 'James Franco', role: 'Will Rodman'),
                  ActorWidget(imageAsset: 'images/andy.jpeg', name: 'Andy Serkis', role: 'Caesar'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Set the container shape
                  color: Colors.white.withOpacity(0.1), // Adjust the opacity to control the blur effect
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewsListButton(),
                    CommentsListButton(),
                    StaffListButton(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rating',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8.0), // Adjust the left padding as needed
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFe8b923)),
                          Icon(Icons.star, color: Color(0xFFe8b923)),
                          Icon(Icons.star, color: Color(0xFFe8b923)),
                          Icon(Icons.star, color: Color(0xFFe8b923)),
                          Icon(Icons.star_border, color: Color(0xFFe8b923)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const ButtonList(),

            ],
          ),
        ),
      ),
    );
  }

  // Function to launch URL
 void _launchURL(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching URL: $e');
    // Handle the error here, e.g., show a dialog or display a snackbar
  }
}

}

class ActorWidget extends StatelessWidget {
  final String imageAsset;
  final String name;
  final String role;

  const ActorWidget({super.key, required this.imageAsset, required this.name, required this.role});

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
        Text(
          name,
          style: const TextStyle(
            fontFamily: "Poppins", // Change the font for actor names
          ),
        ),
        Text(
          role,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontFamily: "Poppins"
          ),
        ),
      ],
    );
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
          MaterialPageRoute(builder: (context) =>  StaffListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0, // Remove the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set the button shape
        ),
      ),
      child: const Text('Staff List', style: TextStyle(color: Color(0xFF793FDF), fontFamily: "Poppins")),
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
          MaterialPageRoute(builder: (context) =>  CastListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0, // Remove the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set the button shape
        ),
      ),
      child: const Text('Actors List', style: TextStyle(color: Color(0xFF793FDF), fontFamily: "Poppins")),
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
          MaterialPageRoute(builder: (context) => NewsPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0, // Remove the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set the button shape
        ),
      ),
      child: const Text('News List', style: TextStyle(color: Color(0xFF793FDF), fontFamily: "Poppins")),
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
          MaterialPageRoute(builder: (context) =>  CommentsPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0, // Remove the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set the button shape
        ),
      ),
      child: const Text('Comments List', style: TextStyle(color: Color(0xFF793FDF), fontFamily: "Poppins")),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventListPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0, // Remove the elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set the button shape
            ),
          ),
          child: const Text('Event Page', style: TextStyle(color: Color(0xFF793FDF), fontFamily: "Poppins")),
        ),
        // Add more buttons as needed
      ],
    );
  }
}