import 'package:flutter/material.dart';

class CommentsListPage extends StatelessWidget {
  const CommentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('comments list'),
      ),
      body: const Center(
        child: Text('reviews'),
      ),
    );
  }
}
