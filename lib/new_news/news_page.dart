import 'package:flutter/material.dart';
import 'database_helper.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  List<Map<String, dynamic>> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    List<Map<String, dynamic>> news = await DatabaseHelper().getNews();
    setState(() {
      _newsList = news;
    });
  }

  void _addNews() async {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      await DatabaseHelper().insertNews({
        'title': _titleController.text,
        'content': _contentController.text,
      });
      _fetchNews();
      _titleController.clear();
      _contentController.clear();
    }
  }

  void _deleteNews(int id) async {
    await DatabaseHelper().deleteNews(id);
    _fetchNews();
  }

  void _updateNews(int id) async {
    Map<String, dynamic> newsToUpdate = _newsList.firstWhere((news) => news['id'] == id, orElse: () => {});
    if (newsToUpdate.isNotEmpty) {
      final TextEditingController _updateTitleController = TextEditingController(text: newsToUpdate['title']);
      final TextEditingController _updateContentController = TextEditingController(text: newsToUpdate['content']);

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update News'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _updateTitleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _updateContentController,
                  decoration: InputDecoration(labelText: 'Content'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  Map<String, dynamic> updatedNews = {
                    'id': id,
                    'title': _updateTitleController.text,
                    'content': _updateContentController.text,
                  };
                  await DatabaseHelper().updateNews(id, updatedNews);
                  _fetchNews();
                  Navigator.pop(context);
                },
                child: Text('Update'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Page'),
      ),
      body: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (context, index) {
          final news = _newsList[index];
          return ListTile(
            title: Text(news['title']),
            subtitle: Text(news['content']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _updateNews(news['id']);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteNews(news['id']);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add News'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(labelText: 'Content'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      _addNews();
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
