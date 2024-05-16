import 'package:flutter/material.dart';

class CastDetailPage extends StatelessWidget {
  final dynamic castDetails;

  CastDetailPage({required this.castDetails});

  @override
  Widget build(BuildContext context) {
    final name = castDetails['name'] ?? '';
    final surname = castDetails['surname'] ?? '';
    final role = castDetails['role'] ?? '';
    final imgUrl = castDetails['imgUrl'] ?? '';
    final description = castDetails['description'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('$name $surname Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name $surname',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Role: $role'),
            SizedBox(height: 10),
            if (imgUrl.isNotEmpty)
              Image.network(
                imgUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),
            Text('Description: $description'),
          ],
        ),
      ),
    );
  }
}