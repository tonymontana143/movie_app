import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'news_model.dart';
import 'db.dart';

class NewsAddScreen extends StatefulWidget {
  const NewsAddScreen({Key? key}) : super(key: key);

  @override
  _NewsAddScreenState createState() => _NewsAddScreenState();
}

class _NewsAddScreenState extends State<NewsAddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addNews(context);
              },
              child: const Text('Add News'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNews(BuildContext context) {
  // Validate input
  if (nameController.text.isEmpty ||
      descriptionController.text.isEmpty ||
      urlController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all fields'),
      ),
    );
    return;
  }

  // Convert DateTime to Timestamp
  Timestamp timestamp = NewsModel.convertDateTimeToTimestamp(DateTime.now());

  // Create NewsModel object
  NewsModel news = NewsModel(
    author: 'Anonymous',
    date: timestamp, // Use the Timestamp object here
    description: descriptionController.text,
    imgUrl: urlController.text,
    readMoreLink: '',
    title: nameController.text,
  );

  // Add news using DBService
  DBService().addNews(news);

  // Show success message
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('News added successfully'),
    ),
  );

  // Clear text fields
  nameController.clear();
  descriptionController.clear();
  urlController.clear();
}

}
