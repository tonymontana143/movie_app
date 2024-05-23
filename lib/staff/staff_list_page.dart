import 'package:flutter/material.dart';
import 'staff_service.dart';
import 'staff_detail_page.dart';

class StaffListPage extends StatefulWidget {
  @override
  _StaffListPageState createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  List<dynamic> staffList = [];

  @override
  void initState() {
    super.initState();
    fetchStaffList();
  }

  Future<void> fetchStaffList() async {
    try {
      final staff = await StaffService.fetchStaffList();
      setState(() {
        staffList = staff;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> createStaff(Map<String, String?> staff) async {
    try {
      await StaffService.createStaff(_convertToNonNull(staff));
      fetchStaffList(); // Refresh the list after creation
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Future<void> updateStaff(String id, Map<String, String?> updatedStaff) async {
    try {
      await StaffService.updateStaff(id, _convertToNonNull(updatedStaff));
      fetchStaffList(); // Refresh the list after update
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  Map<String, String> _convertToNonNull(Map<String, String?> nullableMap) {
    return nullableMap.map((key, value) => MapEntry(key, value ?? ''));
  }

  Future<void> deleteStaff(String staffId) async {
    try {
      await StaffService.deleteStaff(staffId);
      fetchStaffList(); // Refresh the list after deletion
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  void _showEditDialog(BuildContext context, String id, Map<String, dynamic> currentData) {
    TextEditingController nameController = TextEditingController(text: currentData['name'] ?? '');
    TextEditingController positionController = TextEditingController(text: currentData['position'] ?? '');
    TextEditingController departmentController = TextEditingController(text: currentData['department'] ?? '');
    TextEditingController descriptionController = TextEditingController(text: currentData['description'] ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Staff'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
              TextField(controller: positionController, decoration: InputDecoration(labelText: 'Position')),
              TextField(controller: departmentController, decoration: InputDecoration(labelText: 'Department')),
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
                updateStaff(id, {
                  'name': nameController.text,
                  'position': positionController.text,
                  'department': departmentController.text,
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

  void _showDeleteConfirmationDialog(BuildContext context, String staffId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Staff'),
          content: Text('Are you sure you want to delete this staff member?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                deleteStaff(staffId);
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
        title: Text('Staff List'),
      ),
      body: ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return ListTile(
            title: Text('${staff['name'] ?? ''} ${staff['position'] ?? ''}'),
            subtitle: Text(staff['department'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaffDetailPage(staffDetails: staff),
                ),
              );
            },
            onLongPress: () {
              _showEditDialog(context, staff['_id'], staff);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context, staff['_id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController positionController = TextEditingController();
          TextEditingController departmentController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Staff'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
                    TextField(controller: positionController, decoration: InputDecoration(labelText: 'Position')),
                    TextField(controller: departmentController, decoration: InputDecoration(labelText: 'Department')),
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
                      createStaff({
                        'name': nameController.text,
                        'position': positionController.text,
                        'department': departmentController.text,
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

