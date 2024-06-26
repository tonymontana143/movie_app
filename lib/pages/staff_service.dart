import 'dart:convert';
import 'package:http/http.dart' as http;

class StaffService {
  static Future<List<dynamic>> fetchStaffList() async {
    final response = await http.get(Uri.parse('http://172.20.10.3:3000/staff'));
    if (response.statusCode == 200) {
      return List<dynamic>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load staff list');
    }
  }

  static Future<void> addStaff(Map<String, dynamic> staffData) async {
    final response = await http.post(
      Uri.parse('http://172.20.10.3:3000/staff'),
      body: staffData,
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add staff member');
    }
  }

  // Add more methods as needed
}
