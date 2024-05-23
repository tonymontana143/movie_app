import 'dart:convert';
import 'package:http/http.dart' as http;

class CastService {
  static final Uri baseUrl = Uri.parse('https://server-for-flutter-app-2.onrender.com/cast');

  static Future<List<dynamic>> fetchCastList() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load cast');
    }
  }

  static Future<void> createCast(Map<String, String> cast) async {
    final response = await http.post(
      baseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cast),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create cast');
    }
  }

  static Future<void> updateCast(String id, Map<String, String> cast) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cast),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update cast');
    }
  }

  static Future<void> deleteCast(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete cast');
    }
  }
}
