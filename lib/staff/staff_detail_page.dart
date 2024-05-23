import 'package:flutter/material.dart';

class StaffDetailPage extends StatelessWidget {
  final dynamic staffDetails;

  StaffDetailPage({required this.staffDetails});

  @override
  Widget build(BuildContext context) {
    final name = staffDetails['name'] ?? '';
    final position = staffDetails['position'] ?? '';
    final department = staffDetails['department'] ?? '';
    final description = staffDetails['description'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('$name $position Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name $position',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Department: $department'),
            SizedBox(height: 10),

            Text('Description: $description'),
          ],
        ),
      ),
    );
  }
}
