import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> newsImages = {
      'Breaking News 1': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Latest Update 2': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Top Story 3': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Local News 4': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Global Events 5': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Sports Update 6': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
    };

    const List<String> newsTitles = [
      'Breaking News 1',
      'Latest Update 2',
      'Top Story 3',
      'Local News 4',
      'Global Events 5',
      'Sports Update 6',
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
          String newsTitle = newsTitles[index];
          String imageUrl = newsImages[newsTitle] ?? ''; // Get the image URL from the map
          return Card(
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
          );
        },
      ),
    );
  }
}
