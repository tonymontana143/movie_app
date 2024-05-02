import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> newsImages = {
      'Breaking News 1': 'https://images.thedirect.com/media/article_full/planet-of-the-apes-4.jpg',
      'Latest Update 2': 'https://m.media-amazon.com/images/M/MV5BZGI4NTEwNTAtZDcwMi00MDkxLTg1OGYtNTZmMzE3ZDljNzVlXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
      'Top Story 3': 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-9086,resizemode-75,msid-103845041/news/international/us/when-will-the-kingdom-of-the-planet-of-the-apes-release-heres-what-we-know-so-far.jpg',
      'Local News 4': 'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-18960-apes-1800-1404228817.jpg',
      'Global Events 5': 'https://assetsio.gnwcdn.com/Kingdom-of-the-Planet-of-the-Apes_tyrant.jpg?width=1200&height=630&fit=crop&enable=upscale&auto=webp',
      'Sports Update 6': 'https://i.kinja-img.com/image/upload/c_fit,q_60,w_645/d020dd59b90e8125909fb16afe1ea47f.jpg',
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
