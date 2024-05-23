import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/new_news/sql_helper.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}
class _NewsPageState extends State<NewsPage> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    try {
      // Fetch data from the local database
      final localData = await SQLHelper.getItems();
      setState(() {
        _journals = localData;
        _isLoading = false;
      });

      // If local data is empty, fetch data from the server
      if (_journals.isEmpty) {
        final response =
            await http.get(Uri.parse('https://server-for-flutter-app-2.onrender.com/news'));
        if (response.statusCode == 200) {
          final List<dynamic> responseData = json.decode(response.body);
          for (final item in responseData) {
            final title = item['title'] ?? '';
            final description = item['description'] ?? '';
            await SQLHelper.createItem(title, description);
          }
          // Fetch and set data from the local database again
          final updatedData = await SQLHelper.getItems();
          setState(() {
            _journals = updatedData;
          });
        } else {
          throw Exception('Failed to fetch data');
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    } else {
      _titleController.text = '';
      _descriptionController.text = '';
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isNotEmpty) {
                  if (id == null) {
                    await _addItem();
                  } else {
                    await _updateItem(id);
                  }
                  _refreshJournals();
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Title cannot be empty!'),
                  ));
                }
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    String title = _titleController.text ?? '';
    String description = _descriptionController.text ?? '';
    await SQLHelper.createItem(title, description);
  }

  Future<void> _updateItem(int id) async {
    String title = _titleController.text ?? '';
    String description = _descriptionController.text ?? '';
    await SQLHelper.updateItem(id, title, description);
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_journals[index]['title'] ?? ''),
                  subtitle: Text(_journals[index]['description'] ?? ''),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              _showForm(_journals[index]['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              _deleteItem(_journals[index]['id']),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
