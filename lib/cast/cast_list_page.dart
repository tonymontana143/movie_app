import 'package:flutter/material.dart';
import 'package:movie_app/cast/update_cast_page.dart';
import 'cast_service.dart';
import 'add_cast_page.dart';
import 'cast_detail_page.dart';


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
      final cast = await CastService.fetchCastList();
      setState(() {
        castList = cast;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> deleteCast(String castId) async {
    try {
      await CastService.deleteCast(castId);
      fetchCastList(); // Refresh the list after deletion
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cast List'),
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
            onLongPress: () {
              _showOptionsDialog(context, castList[index]['_id']);
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
        child: Icon(Icons.add),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String castId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options'),
          content: Text('What do you want to do with this cast member?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateCastPage(castId: castId),
                  ),
                ).then((_) {
                  fetchCastList();
                });
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showDeleteConfirmationDialog(context, castId);
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String castId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Cast'),
          content: Text('Are you sure you want to delete this cast member?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteCast(castId);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
