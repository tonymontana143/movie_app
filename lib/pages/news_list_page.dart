import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    const Map<String, String> newsImages = {
      'New Planet of the Apes Sequel':
      'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Celebrate performance':
      'https://m.media-amazon.com/images/M/MV5BZGI4NTEwNTAtZDcwMi00MDkxLTg1OGYtNTZmMzE3ZDljNzVlXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
      'Will the movie release?':
      'https://img.etimg.com/thumb/width-1200,height-900,imgsize-9086,resizemode-75,msid-103845041/news/international/us/when-will-the-kingdom-of-the-planet-of-the-apes-release-heres-what-we-know-so-far.jpg',
      'Complete History':
      'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-18960-apes-1800-1404228817.jpg',
      'Director describes the movie':
      'https://assetsio.gnwcdn.com/Kingdom-of-the-Planet-of-the-Apes_tyrant.jpg?width=1200&height=630&fit=crop&enable=upscale&auto=webp',
      'Rise of franchise':
      'https://i.kinja-img.com/image/upload/c_fit,q_60,w_645/d020dd59b90e8125909fb16afe1ea47f.jpg',
    };

    const List<String> newsTitles = [
      'New Planet of the Apes Sequel',
      'Celebrate performance',
      'Will the movie release?',
      'Complete History',
      'Director describes the movie',
      'Rise of franchise',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('News', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF132C33), // Deep blue
      ),
      backgroundColor: const Color(0xFF1E1E1E), // Dark gray
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: newsTitles.length,
        itemBuilder: (BuildContext context, int index) {
          final String newsTitle = newsTitles[index];
          final String imageUrl = newsImages[newsTitle] ?? ''; // Get the image URL from the map
          final String author = _getAuthor(newsTitle); // Get Author
          final String date = _getDate(newsTitle); // Get Date
          final String link = _getLink(newsTitle); // Get Link
          final String text = _getText(newsTitle); // Get text

          return GestureDetector(
            onTap: () {
              // Navigate to NewsDetailPage with necessary data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    newsTitle: newsTitle,
                    author: author,
                    date: date,
                    link: link,
                    text: text,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              color: const Color(0xFF253238), // Darker blue-gray
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      newsTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to get author based on news title
  String _getAuthor(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return 'Richard Nebens';
      case 'Celebrate performance':
        return 'Bill Desowitz';
      case 'Will the movie release?':
        return 'Jane Smith';
      case 'Complete History':
        return 'Don Kaye';
      case 'Director describes the movie':
        return 'Fran Ruiz';
      case 'Rise of franchise':
        return 'Andy Serkiz';
      default:
        return '';
    }
  }

  // Function to get date based on news title
  String _getDate(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return 'September 29, 2022';
      case 'Celebrate performance':
        return 'May 1,  2022';
      case 'Will the movie release?':
        return 'September 21, 2023';
      case 'Complete History':
        return 'July 1, 2014';
      case 'Director describes the movie':
        return 'December 21, 2023';
      case 'Sports Update 6':
        return 'April 22, 2024';
      default:
        return '';
    }
  }

  // Function to get link based on news title
  String _getLink(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return 'https://thedirect.com/article/disney-planet-of-the-apes-sequel';
      case 'Celebrate performance':
        return 'https://www.indiewire.com/features/craft/kingdom-of-the-planet-of-the-apes-vfx-bluray-comparison-1234997712/';
      case 'Will the movie release?':
        return "Having concluded filming in early 2023, fans are eagerly awaiting the release of the first trailer for Kingdom of the Planet of the Apes. While it's theoretically possible for a trailer to debut at any time, it is unlikely to surface until later in the year or early 2024. Comparatively, Disney released a teaser for The Little Mermaid eight months before its May 26, 2023 release date, aligning with the same Memorial Day weekend timeframe as Kingdom of the Planet of the Apes next year. Therefore, a teaser for the Apes film might be anticipated around September or later in 2023, offering a captivating glimpse into the next chapter of the Planet of the Apes saga.";
      case 'Complete History':
        return 'https://www.rollingstone.com/tv-movies/tv-movie-news/human-see-human-do-a-complete-history-of-planet-of-the-apes-107958/';
      case 'Director describes the movie':
        return 'https://www.vg247.com/kingdom-of-the-planet-of-the-apes-director-apocalypto-with-apes';
      case 'Rise of franchise':
        return 'https://gizmodo.com/rise-of-the-planet-of-the-apes-retro-review-andy-serkis-1851422850';
      default:
        return '';
    }
  }

  // Function to get text based on news title
  String _getText(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return "Through the movie's official Twitter page, 20th Century Studios shared the first official image from Kingdom of the Planet of the Apes, which is set for theatrical release in 2024. This will be the first Planet of the Apes film since Disney bought 20th Century Fox. Through the movie's official Twitter page, 20th Century Studios shared the first official image from Kingdom of the Planet of the Apes, which is set for theatrical release in 2024.This will be the first Planet of the Apes film since Disney bought 20th Century Fox.The image provides a look at the movie's leading character, Owen Teague's Cornelius, as he rides a horse with a bird flying down to land on his arm. They ride in front of what appears to be a massive moss-filled city on the edge of a river and a waterfall.";
      case 'Celebrate performance':
        return "Ball calls it a great collaboration between actor and animator, but it’s a process “so mysterious that it’s misunderstood.” In fact, he invited Serkis to serve as special consultant by showing these performance-capture newbies how to move and find their voice with more chatty ape characters. “There’s a lot of interpretation and really careful consideration,” Ball added.In the seven years since “War for the Planet of the Apes,” the last of the Caesar trilogy, Wētā has made several refinements to the performance capture process, including tools for muscle simulation, facial animation, and grooming. Together with dual-camera facial rigs from “Avatar: The Way of Water,” the studio has been able to capture greater detail, emotion, and vocal articulation.";
      case 'Will the movie release?':
        return 'The official release date for Kingdom of the Planet of the Apes is May 24, 2024, marking the first installment since Disney acquired 20th Century Fox in 2019. Consequently, it falls under the newly rebranded 20th Century Studios umbrella. Notably, this film is not a reboot; it serves as a direct continuation of the storyline initiated by Matt Reeves Apes trilogy, culminating in War for the Planet of the Apes in 2017.';
      case 'Complete History':
        return 'From screaming Charlton Heston to Saturday-morning cartoons and summer-movie reboots, we trace the evolution of the simian sci-fi franchise';
      case 'Director describes the movie':
        return 'Director Wes Balls (now also attached to the live-action Legend of Zelda movie) one-line pitch for Kingdom of the Planet of the Apes was a surprising but enticing one.';
      case 'Rise of franchise':
        return 'Rise of the Planet of the Apes achieves the unthinkable. Its a prequel film to an iconic classic that approaches the material in a fresh, interesting way, stands on its own, and doesnt tarnish the legacy or integrity of its predecessors. On paper, it shouldnt work. Throughout movie history, it usually doesnt. But in 2011, Rise of the Planet of the Apes came out, did all that, and we are still talking about its repercussions today.';
      default:
        return '';
    }
  }
}

class NewsDetailPage extends StatelessWidget {
  final String newsTitle;
  final String author;
  final String date;
  final String link;
  final String text;

  const NewsDetailPage({
    Key? key,
    required this.newsTitle,
    required this.author,
    required this.date,
    required this.link,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF132C33), // Deep blue
      ),
      backgroundColor: const Color(0xFF1E1E1E), // Dark gray
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              newsTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text('Author: $author', style: const TextStyle(color: Colors.white)),
            Text('Date: $date', style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _launchURL(link); // Open the link when tapped
              },
              child: const Text(
                'Read More',
                style: TextStyle(
                  color: Color(0xFFD4AF37), // Gold
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) { // Pass Uri directly to canLaunchUrl
      await launchUrl(uri); // Pass Uri directly to launchUrl
    } else {
      throw 'Could not launch $url';
    }
  }


}