import 'package:cloud_firestore/cloud_firestore.dart';
import 'news_edit_screen.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  final String docId;

  const NewsDetailsPage({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('news').doc(docId).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...", style: TextStyle(color: Colors.white));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Text("No Data", style: TextStyle(color: Colors.white));
            }
            var newsData = snapshot.data!;
            return Text(newsData['title'], style: const TextStyle(color: Colors.white));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsEditScreen(documentId: docId),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('news').doc(docId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No data available"));
          }
          var newsData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  newsData['imgUrl'],
                  errorBuilder: (context, error, stackTrace) {
                    // Default image if there is an error loading the image
                    return Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/2/2d/Brian_Cox_%282016%29_-_01.jpg",
                      fit: BoxFit.cover,
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  newsData['description'],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
