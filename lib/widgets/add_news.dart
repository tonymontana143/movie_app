import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:movie_app/firebase_services/db_service.dart";
import "package:movie_app/models/news_model.dart";

class AddNews extends StatefulWidget {
  late String newsTitle;
  late String author;
  late String link;
  late String text;
  late String imgUrl;

  AddNews({
    super.key
  });

  @override
  State<AddNews> createState() => _EditNewsState();
}

class _EditNewsState extends State<AddNews> {
  late TextEditingController newsTitleController;

  late TextEditingController authorController;

  late TextEditingController imgController;

  late TextEditingController linkController;

  late TextEditingController textController;

  final DBService _dbService = DBService();

  @override
  void initState() {
    super.initState();

    newsTitleController = TextEditingController();
    authorController = TextEditingController();
    linkController = TextEditingController();
    imgController = TextEditingController();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    newsTitleController.dispose();
    authorController.dispose();
    imgController.dispose();
    linkController.dispose();
    textController.dispose();
    super.dispose();
  }

  void submit() {
    String title = newsTitleController.text;
    String author = authorController.text;
    String imgUrl = imgController.text;
    String description = textController.text;
    String link = linkController.text;
    Timestamp date = Timestamp.now();

    NewsModel newNews = NewsModel(
        author: author,
        date: date,
        description: description,
        imgUrl: imgUrl,
        readMoreLink: link,
        title: title
    );

    if(
    title != "" &&
    author != "" &&
    imgUrl != "" &&
    description != "" &&
    link != ""
    ) {
      _dbService.addNews(newNews);
      Navigator.of(context).pop();
    } else {

      const snackbar = SnackBar(content: Text("Fill all fields!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.of(context).pop();
    }
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero, // Remove default padding
      content: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.8, // Set the width to 70% of the screen width
        padding: const EdgeInsets.all(20), // Add padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add News",
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            // Add spacing between title and text fields
            TextField(
              style: const TextStyle(fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              controller: newsTitleController,
            ),
            TextField(
              style: const TextStyle(fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Author",
                hintStyle: TextStyle(fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              controller: authorController,
            ),
            TextField(
              style: const TextStyle(fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Image URL",
                hintStyle: TextStyle(fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              controller: imgController,
            ),
            TextField(
              style: const TextStyle(fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Text",
                hintStyle: TextStyle(fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              controller: textController,
            ),
            TextField(
              style: const TextStyle(fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: "Link",
                hintStyle: TextStyle(fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              controller: linkController,
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