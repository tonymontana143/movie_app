import 'package:flutter/material.dart';

class StaffDetailPage extends StatelessWidget {
  final dynamic staffDetails;

  StaffDetailPage({required this.staffDetails});

  @override
  Widget build(BuildContext context) {
    final name = staffDetails['name'] ?? '';
    final surname = staffDetails['surname'] ?? '';
    final position = staffDetails['position'] ?? '';

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
            Text('Position: $position'),
          ],
        ),
      ),
    );
  }
}
