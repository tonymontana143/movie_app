import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateStaffPage extends StatelessWidget {
  final String staffId;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  UpdateStaffPage({required this.staffId});

  Future<void> updateStaff(BuildContext context) async {
    final response = await http.put(
      Uri.parse('https://server-for-flutter-app-2.onrender.com/staff/$staffId'),
      body: {
        'name': _nameController.text ?? '',
        'surname': _surnameController.text ?? '',
        'position': _positionController.text ?? '',
      },
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Staff Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateStaff(context);
              },
              child: Text('Update Staff Member'),
            ),
          ],
        ),
      ),
    );
  }
}
