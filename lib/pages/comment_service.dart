import 'dart:convert';
import 'package:http/http.dart' as http;
import 'comment.dart';
class CommentService {
  static final Uri baseUrl = Uri.parse('http://172.20.10.3:3000/comments');

  static Future<List<Comment>> fetchComments() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  static Future<Comment> createComment(String text) async {
    final response = await http.post(
      baseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );
    if (response.statusCode == 201) {
      return Comment.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create comment');
    }
  }

  static Future<void> updateComment(String id, String newText) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': newText}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update comment');
    }
  }
  

  static Future<void> deleteComment(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete comment');
    }
  }
}
