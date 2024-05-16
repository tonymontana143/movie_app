import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:movie_app/firebase_services/db_service.dart";
import "package:movie_app/widgets/add_news.dart";
import "news_detail_page.dart"; // Import url_launcher

class NewsListPage extends StatelessWidget {
  NewsListPage({super.key});

  final DBService _dbService = DBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF132C33), // Deep blue
      ),
      backgroundColor: const Color(0xFF1E1E1E), // Dark gray
      body: StreamBuilder(
        stream: _dbService.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            List news = snapshot.data?.docs ?? [];
            if (news.isEmpty) {
              return const Center(
                child: Text(
                  "No News Available!",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(
                          newsTitle: news[index]["title"],
                          author: news[index]["author"],
                          date: news[index]["date"],
                          link: news[index]["readMoreLink"],
                          text: news[index]["description"],
                          imgUrl: news[index]["imgUrl"],
                          id: news[index].id
                          ),
                        )
                      );
                    },
                  child: NewsCard(
                    title: news[index]["title"],
                    author: news[index]["author"],
                    date: news[index]["date"],
                    description: news[index]["description"],
                    imgUrl: news[index]["imgUrl"],
                    link: news[index]["readMoreLink"],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddNews();
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),

    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final Timestamp date;
  final String description;
  final String imgUrl;
  final String link;

  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.description,
    required this.imgUrl,
    required this.link
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imgUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'By $author',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Published: ${date.toDate().toString()}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                // Handle link press
              },
              child: const Text('Read More'),
            ),
          ),
        ],
      ),
    );
  }
}
