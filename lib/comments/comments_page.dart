import 'package:flutter/material.dart';
import 'comment.dart';
import 'comment_service.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _fetchComments() async {
    try {
      final comments = await CommentService.fetchComments();
      setState(() {
        _comments = comments;
      });
    } catch (e) {
      print('Failed to fetch comments: $e');
    }
  }

  Future<void> _addComment(String text) async {
    try {
      await CommentService.createComment(text);
      await _fetchComments();
    } catch (e) {
      print('Failed to add comment: $e');
    }
  }

  Future<void> _updateComment(String id, String newText) async {
    try {
      await CommentService.updateComment(id, newText);
      await _fetchComments();
    } catch (e) {
      print('Failed to update comment: $e');
    }
  }

  Future<void> _deleteComment(String id) async {
    try {
      await CommentService.deleteComment(id);
      await _fetchComments();
    } catch (e) {
      print('Failed to delete comment: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.text),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteComment(comment.id),
            ),
            onTap: () async {
              final updatedText = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Edit Comment'),
                    content: TextField(
                      controller: TextEditingController(text: comment.text),
                      onChanged: (value) => setState(() {}),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, _textEditingController.text),
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
              if (updatedText != null) {
                _updateComment(comment.id, updatedText);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final text = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Comment'),
                content: TextField(
                  controller: _textEditingController,
                  onChanged: (value) => setState(() {}),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, _textEditingController.text),
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
          if (text != null) {
            _addComment(text);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
