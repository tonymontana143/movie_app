import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'staff_list_page.dart'; // Update with your actual package name

class AddStaffPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  Future<void> addStaff(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://server-for-flutter-app-2.onrender.com/staff'),
        body: {
          'name': _nameController.text ?? '',
          'surname': _surnameController.text ?? '',
          'position': _positionController.text ?? '',
        },
      );
      if (response.statusCode == 201) {
        Navigator.pop(context);
      } else {
        throw Exception('Failed to add staff member');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Staff Member'),
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
                addStaff(context);
              },
              child: Text('Add Staff Member'),
            ),
          ],
        ),
      ),
    );
  }
}
