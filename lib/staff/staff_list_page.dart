import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add_staff_page.dart';
import 'staff_detail_page.dart';
import 'update_staff_page.dart';
import 'staff_service.dart'; // Make sure to import your service class

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

  Future<void> deleteStaff(String staffId) async {
    try {
      await StaffService.deleteStaff(staffId);
      fetchStaffList(); // Refresh the list after deletion
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
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
          final name = staffList[index]['name'] ?? '';
          final surname = staffList[index]['surname'] ?? '';
          final position = staffList[index]['position'] ?? '';
          return ListTile(
            title: Text('$name $surname'),
            subtitle: Text(position),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaffDetailPage(
                    staffDetails: staffList[index],
                  ),
                ),
              );
            },
            onLongPress: () {
              _showOptionsDialog(context, staffList[index]['_id']);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStaffPage()),
          ).then((_) {
            fetchStaffList();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String staffId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options'),
          content: Text('What do you want to do with this staff member?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateStaffPage(staffId: staffId),
                  ),
                ).then((_) {
                  fetchStaffList();
                });
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showDeleteConfirmationDialog(context, staffId);
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

  void _showDeleteConfirmationDialog(BuildContext context, String staffId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Staff'),
          content: Text('Are you sure you want to delete this staff member?'),
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
                deleteStaff(staffId);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
