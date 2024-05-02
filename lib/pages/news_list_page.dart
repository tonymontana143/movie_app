import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> newsImages = {
      'New Planet of the Apes Sequel': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Celebrate performance': 'https://m.media-amazon.com/images/M/MV5BZGI4NTEwNTAtZDcwMi00MDkxLTg1OGYtNTZmMzE3ZDljNzVlXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
      'Will the movie release?': 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-9086,resizemode-75,msid-103845041/news/international/us/when-will-the-kingdom-of-the-planet-of-the-apes-release-heres-what-we-know-so-far.jpg',
      'Complete History': 'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-18960-apes-1800-1404228817.jpg',
      'Director describes the movie': 'https://assetsio.gnwcdn.com/Kingdom-of-the-Planet-of-the-Apes_tyrant.jpg?width=1200&height=630&fit=crop&enable=upscale&auto=webp',
      'Rise of franchise': 'https://i.kinja-img.com/image/upload/c_fit,q_60,w_645/d020dd59b90e8125909fb16afe1ea47f.jpg',
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
        title: const Text('News'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: newsTitles.length,
        itemBuilder: (BuildContext context, int index) {
          final String newsTitle = newsTitles[index];
          final String imageUrl = newsImages[newsTitle] ?? ''; // Get the image URL from the map
          final String author = _getAuthor(newsTitle);
          final String date = _getDate(newsTitle);
          final String link = _getLink(newsTitle);
          final String text = _getText(newsTitle);

          return GestureDetector(
            onTap: () {
              _showNewsDialog(context, newsTitle, author, date, link, text); // Show dialog on tap
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      newsTitle,
                      style: const TextStyle(fontSize: 16),
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

  void _showNewsDialog(BuildContext context, String newsTitle, String author, String date, String link, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(newsTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Author: $author'),
              Text('Date: $date'),
              const SizedBox(height: 10),
              Text(text),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _launchURL(link); // Open the link when tapped
                },
                child: Text(
                  'Read More',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }


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

  String _getLink(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return 'https://thedirect.com/article/disney-planet-of-the-apes-sequel';
      case 'Celebrate performance':
        return 'https://www.indiewire.com/features/craft/kingdom-of-the-planet-of-the-apes-vfx-bluray-comparison-1234997712/';
      case 'Will the movie release?':
        return 'https://economictimes.indiatimes.com/news/international/us/when-will-the-kingdom-of-the-planet-of-the-apes-release-heres-what-we-know-so-far/articleshow/103845041.cms?from=mdr';
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

  String _getText(String newsTitle) {
    switch (newsTitle) {
      case 'New Planet of the Apes Sequel':
        return 'Through the movies official Twitter page, 20th Century Studios shared the first official image from Kingdom of the Planet of the Apes, which is set for theatrical release in 2024. This will be the first Planet of the Apes film since Disney bought 20th Century Fox.';
      case 'Celebrate performance':
        return 'The performance was celebrated with great enthusiasm by the audience, who were captivated by the stunning display of talent and artistry.';
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
