import 'package:cloud_firestore/cloud_firestore.dart';
import 'news_add_screen.dart';
import 'news_detail_page.dart'; // Import the NewsDetailsPage
import 'package:flutter/material.dart';

class NewssListPage extends StatelessWidget {
  const NewssListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsAddScreen()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          "News list",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final newss = snapshot.data!.docs;

            return ListView.builder(
              itemCount: newss.length,
              itemBuilder: (context, index) {
                final news = newss[index].data() as Map<String, dynamic>;
                final name = news['title'] as String;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        news['imgUrl'] as String,

                      ),
                    ),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delet news'),
                            content: const Text(
                                'Are you sure?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('news')
                                      .doc(newss[index].id)
                                      .delete();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsPage(docId: newss[index].id), // Pass the docId to the NewsDetailsPage
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
