import "package:flutter/material.dart";

class EditNews extends StatefulWidget {
  final String newsTitle;
  final String author;
  final String link;
  final String text;
  final String imgUrl;

  const EditNews({
    super.key,
    required this.newsTitle,
    required this.author,
    required this.link,
    required this.text,
    required this.imgUrl
  });

  @override
  State<EditNews> createState() => _EditNewsState();
}

class _EditNewsState extends State<EditNews> {
  late TextEditingController newsTitleController;

  late TextEditingController authorController;

  late TextEditingController imgController;

  late TextEditingController linkController;

  late TextEditingController textController;

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
    // lol
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
              "Edit News",
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