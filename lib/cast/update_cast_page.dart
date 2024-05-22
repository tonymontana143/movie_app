import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateCastPage extends StatefulWidget {
  final String castId;

  UpdateCastPage({required this.castId});

  @override
  _UpdateCastPageState createState() => _UpdateCastPageState();
}

class _UpdateCastPageState extends State<UpdateCastPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCastDetails();
  }

  Future<void> _fetchCastDetails() async {
    final response = await http.get(Uri.parse('https://server-for-flutter-app-2.onrender.com/cast/${widget.castId}'));
    if (response.statusCode == 200) {
      final cast = json.decode(response.body);
      setState(() {
        _nameController.text = cast['name'];
        _surnameController.text = cast['surname'];
        _imgUrlController.text = cast['imgUrl'];
        _roleController.text = cast['role'];
        _descriptionController.text = cast['description'];
      });
    } else {
      // Handle error
    }
  }

  Future<void> updateCast(BuildContext context) async {
    final response = await http.put(
      Uri.parse('http://172.20.10.3:3000/cast/${widget.castId}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _nameController.text,
        'surname': _surnameController.text,
        'imgUrl': _imgUrlController.text,
        'role': _roleController.text,
        'description': _descriptionController.text,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update cast member')),
      );
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
