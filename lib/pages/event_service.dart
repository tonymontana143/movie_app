import 'dart:convert';
import 'package:http/http.dart' as http;
import 'event.dart';

class EventService {
  static const String baseUrl = '/events';

  static Future<List<Event>> getEvents() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((event) => Event.fromJson(event)).toList();
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<Event> createEvent(String title, DateTime date) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title, 'date': date.toIso8601String()}),
      );
      if (response.statusCode == 201) {
        return Event.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<void> updateEvent(String id, String title, DateTime date) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title, 'date': date.toIso8601String()}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<void> deleteEvent(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
