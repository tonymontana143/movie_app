import 'dart:convert';
import 'package:http/http.dart' as http;
import 'database_helper.dart';

class NewsService {
  Future<void> fetchAndSaveNews() async {
    final url = 'https://server-for-flutter-app-3.onrender.com/news';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> newsData = jsonDecode(response.body);

        for (var news in newsData) {
          await DatabaseHelper().insertNews({
            'title': news['title'],
            'content': news['content'],
            'url': news['url'],
          });
        }
        print('News saved to local database successfully.');
      } else {
        print('Failed to fetch news from the server.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
