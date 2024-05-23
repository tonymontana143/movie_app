import 'dart:convert';
import 'package:http/http.dart' as http;

class StaffService {
  static final Uri baseUrl = Uri.parse('https://server-for-flutter-app-2.onrender.com/staff');

  static Future<List<dynamic>> fetchStaffList() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load staff');
    }
  }

  static Future<void> createStaff(Map<String, String> staff) async {
    final response = await http.post(
     
      baseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(staff),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create staff');
    }
  }

  static Future<void> updateStaff(String id, Map<String, String> staff) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(staff),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update staff');
    }
  }

  static Future<void> deleteStaff(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete staff');
    }
  }
}
