import 'package:flutter/material.dart';
import 'cast_service.dart';
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

  Future<void> createCast(Map<String, String?> cast) async {
    try {
      await CastService.createCast(_convertToNonNull(cast));
      fetchCastList(); // Refresh the list after creation
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> updateCast(String id, Map<String, String?> updatedCast) async {
    try {
      await CastService.updateCast(id, _convertToNonNull(updatedCast));
      fetchCastList(); // Refresh the list after update
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Map<String, String> _convertToNonNull(Map<String, String?> nullableMap) {
    return nullableMap.map((key, value) => MapEntry(key, value ?? ''));
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

  void _showEditDialog(BuildContext context, String id, Map<String, dynamic> currentData) {
    TextEditingController nameController = TextEditingController(text: currentData['name'] ?? '');
    TextEditingController surnameController = TextEditingController(text: currentData['surname'] ?? '');
    TextEditingController roleController = TextEditingController(text: currentData['role'] ?? '');
    TextEditingController descriptionController = TextEditingController(text: currentData['description'] ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Cast'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
              TextField(controller: surnameController, decoration: InputDecoration(labelText: 'Surname')),
              TextField(controller: roleController, decoration: InputDecoration(labelText: 'Role')),
              TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                updateCast(id, {
                  'name': nameController.text,
                  'surname': surnameController.text,
                  'role': roleController.text,
                  'description': descriptionController.text,
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String castId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Cast'),
          content: Text('Are you sure you want to delete this cast member?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                deleteCast(castId);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
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
          final cast = castList[index];
          return ListTile(
            title: Text('${cast['name'] ?? ''} ${cast['surname'] ?? ''}'),
            subtitle: Text(cast['role'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CastDetailPage(castDetails: cast),
                ),
              );
            },
            onLongPress: () {
              _showEditDialog(context, cast['_id'], cast);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context, cast['_id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController surnameController = TextEditingController();
          TextEditingController imgUrlController = TextEditingController();
          TextEditingController roleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Cast'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
                    TextField(controller: surnameController, decoration: InputDecoration(labelText: 'Surname')),
                    TextField(controller: imgUrlController, decoration: InputDecoration(labelText: 'Image URL')),
                    TextField(controller: roleController, decoration: InputDecoration(labelText: 'Role')),
                    TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      createCast({
                        'name': nameController.text,
                        'surname': surnameController.text,
                        'imgUrl': imgUrlController.text,
                        'role': roleController.text,
                        'description': descriptionController.text,
                      });
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
