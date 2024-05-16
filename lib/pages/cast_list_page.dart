import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add_cast_page.dart';
import 'cast_detail_page.dart';
import 'edit_cast_page.dart';

class CastListPage extends StatefulWidget {
  @override
  _CastListPageState createState() => _CastListPageState();
}

class _CastListPageState extends State<CastListPage> {
  List<dynamic> castList = [];

  @override
  void initState() {
    super.initState();
    fetchCastList();
  }

  Future<void> fetchCastList() async {
    try {
      final response =
      await http.get(Uri.parse('http://172.20.10.3:3000/cast'));
      if (response.statusCode == 200) {
        setState(() {
          castList = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load cast list');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> deleteAnItem(String id) async {
    try {
      final response = await http.delete(Uri.parse('http://172.20.10.3:3000/cast/deleteCast/$id'));
      if (response.statusCode == 200) {
        print('Item deleted successfully');
        // Refresh cast list after deletion
        fetchCastList();
      } else {
        print('Failed to delete item');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast List'),
      ),
      body: ListView.builder(
        itemCount: castList.length,
        itemBuilder: (context, index) {
          final name = castList[index]['name'] ?? '';
          final surname = castList[index]['surname'] ?? '';
          final role = castList[index]['role'] ?? '';
          return ListTile(
            title: Text('$name $surname'),
            subtitle: Text(role),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    const EditCastPage();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteAnItem(castList[index]['id']);
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CastDetailPage(
                    castDetails: castList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCastPage()),
          ).then((_) {
            fetchCastList();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
