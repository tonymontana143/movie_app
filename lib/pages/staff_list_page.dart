import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add_staff_page.dart'; // Update with your actual package name
import 'staff_detail_page.dart'; // Update with your actual package name
import 'update_staff_page.dart'; // Update with your actual package name

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
      final response =
          await http.get(Uri.parse('http://172.20.10.3:3000/staff'));
      if (response.statusCode == 200) {
        setState(() {
          staffList = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load staff list');
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
              _showUpdateDialog(context, staffList[index]['_id']);
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

  void _showUpdateDialog(BuildContext context, String staffId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Staff'),
          content: Text('Do you want to update this staff member?'),
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
          ],
        );
      },
    );
  }
}
