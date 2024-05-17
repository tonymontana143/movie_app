import 'dart:convert';
import 'package:http/http.dart' as http;

class CastService {
  static Future<List<dynamic>> fetchCastList() async {
    final response = await http.get(Uri.parse('http://172.20.10.3:3000/cast'));
    if (response.statusCode == 200) {
      return List<dynamic>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load cast list');
    }
  }

  static Future<void> addCast(Map<String, dynamic> castData) async {
    final response = await http.post(
      Uri.parse('http://172.20.10.3:3000/cast'),
      body: json.encode(castData),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add cast member');
    }
  }

  static Future<void> updateCast(String castId, Map<String, dynamic> castData) async {
    final response = await http.put(
      Uri.parse('http://172.20.10.3:3000/cast/$castId'),
      body: json.encode(castData),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update cast member');
    }
  }

  static Future<void> deleteCast(String castId) async {
    final response = await http.delete(
      Uri.parse('http://172.20.10.3:3000/cast/$castId'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete cast member');
    }
  }
}
