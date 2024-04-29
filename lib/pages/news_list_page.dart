import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('news'),
      ),
      body: const Center(
        child: Text('news'),
      ),
    );
  }
}
