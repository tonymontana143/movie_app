import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:movie_app/firebase_services/db_service.dart";
import "package:movie_app/widgets/edit_news.dart";
import "package:url_launcher/url_launcher.dart";

class NewsDetailPage extends StatelessWidget {
  final String newsTitle;
  final String author;
  final Timestamp date;
  final String link;
  final String text;
  final String imgUrl;
  final String id;

  NewsDetailPage({
    super.key,
    required this.newsTitle,
    required this.author,
    required this.date,
    required this.link,
    required this.text,
    required this.imgUrl,
    required this.id
  });

  final DBService _dbService = DBService();

  void deleteNews() {
    _dbService.deleteNews(id);
  }

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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditNews(
                            newsTitle: newsTitle,
                            author: author,
                            link: link,
                            text: text,
                            imgUrl: imgUrl,
                            id: id
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xFFC7C8CC),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                      onTap: deleteNews,
                      child: const Icon(
                        Icons.delete,
                        color: Color(0xFFC7C8CC)
                      ),
                    ),
                  )
                ]
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