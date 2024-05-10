import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/pages/staff_list_page.dart';

class PopUpDialog extends StatefulWidget {
  final String type;

  const PopUpDialog({
    super.key,
    required this.type,
  });

  @override
  _PopUpDialogState createState() => _PopUpDialogState();
}

class _PopUpDialogState extends State<PopUpDialog> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController imgUrlController;
  late TextEditingController posRoleController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    surnameController = TextEditingController();
    imgUrlController = TextEditingController();
    posRoleController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    imgUrlController.dispose();
    posRoleController.dispose();
    descController.dispose();

    super.dispose();
  }

  void submit() {
    Map<String, String> data = {
      'name': nameController.text,
      'surname': surnameController.text,
      'imgUrl': imgUrlController.text,
      'posRole': posRoleController.text,
      'description': descController.text,
    };
    if(
    data["name"] != "" ||
    data["surname"] != "" ||
    data["imgUrl"] != "" ||
    data["posRole"] != "" ||
    data["description"] != ""
    ) {
      Navigator.of(context).pop(data);
      widget.type == "Staff" ? addStaffMember(data) : addCastMember(data);
    } else {
      const invalidInputSnackBar = SnackBar(
        content: Text(
            "The data was not saved, please fill all fields",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),
        )
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(invalidInputSnackBar);
    }
  }

  void addStaffMember(data) async{

    var regBody = {
      "id": "lmao_id",
      "name": data["name"],
      "surname": data["surname"],
      "imgUrl": data["imgUrl"],
      "position": data["posRole"],
      "description": data["description"],
    };

    var response = await http.post(Uri.parse("http://localhost:3000/storeStaff"),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(regBody)
    );

    var jsonResponse = jsonDecode(response.body);

    if(jsonResponse["status"]) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffListPage()));
    }

  }

  void addCastMember(data) async{

    var regBody = {
      "id": "lmao_id",
      "name": data["name"],
      "surname": data["surname"],
      "imgUrl": data["imgUrl"],
      "role": data["posRole"],
      "description": data["description"],
    };

    var response = await http.post(Uri.parse("http://localhost:3000/storeCast"),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(regBody)
    );

    var jsonResponse = jsonDecode(response.body);

    if(jsonResponse["status"]) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffListPage()));
    }

  }

  void cancel() {
    // const invalidInputSnackBar = SnackBar(
    //     content: Text(
    //       "The data was not saved, action cancelled",
    //       style: TextStyle(
    //           fontFamily: "Poppins",
    //           fontSize: 12,
    //           fontWeight: FontWeight.w600
    //       ),
    //     )
    // );
    // ScaffoldMessenger.of(context).showSnackBar(invalidInputSnackBar);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero, // Remove default padding
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Set the width to 70% of the screen width
          padding: const EdgeInsets.all(20), // Add padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                widget.type == "Staff" ? "Add a Staff Member" : "Add a Cast Member",
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10), // Add spacing between title and text fields
              TextField(
                style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                ),
                controller: nameController,
              ),
              TextField(
                style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  hintText: "Surname",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                ),
                controller: surnameController,
              ),
              TextField(
                style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  hintText: "Image URL",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                ),
                controller: imgUrlController,
              ),
              TextField(
                style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: widget.type == "Staff" ? "Position" : "Role",
                  hintStyle: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                ),
                controller: posRoleController,
              ),
              TextField(
                style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600),
                ),
                controller: descController,
              ),
               Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilledButton(
                        onPressed: submit,
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FilledButton(
                        onPressed: cancel,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
