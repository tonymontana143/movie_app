import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateCastPage extends StatelessWidget {
  final String castId;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  UpdateCastPage({required this.castId});

  Future<void> updateCast(BuildContext context) async {
    final response = await http.put(
      Uri.parse('http://172.20.10.3:3000/cast/$castId'),
      body: {
        'name': _nameController.text ?? '',
        'surname': _surnameController.text ?? '',
        'imgUrl': _imgUrlController.text ?? '',
        'role': _roleController.text ?? '',
        'description': _descriptionController.text ?? '',
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
        title: Text('Update Cast Member'),
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
              controller: _imgUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateCast(context);
              },
              child: Text('Update Cast Member'),
            ),
          ],
        ),
      ),
    );
  }
}
