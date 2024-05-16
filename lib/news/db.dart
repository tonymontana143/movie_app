import 'package:cloud_firestore/cloud_firestore.dart';

import 'news_model.dart';

class DBService {
  final CollectionReference newssCollection =
      FirebaseFirestore.instance.collection('news');
  
 

  Future addNews(NewsModel news) async {
    try {
      await newssCollection.add({
              'author': news.author,
      'date': news.date,
      'description': news.description,
      'imgUrl': news.imgUrl, // Changed from desc
        'readMoreLink': news.readMoreLink,
        'title': news.title
      });
    } catch (e) {
      print(e.toString());
    }
}


  Stream<QuerySnapshot> getNews() {
    return FirebaseFirestore.instance.collection('news').snapshots();
  }


  void updateNews(String id, NewsModel news) async {
    FirebaseFirestore.instance
        .collection('news')
        .doc(id)
        .update({
      'author': news.author,
      'date': news.date,
      'description': news.description,
      'imgUrl': news.imgUrl, // Changed from desc
        'readMoreLink': news.readMoreLink,
        'title': news.title // Changed from link
    });
  }

  void deleteNews(String id) async {
    FirebaseFirestore.instance.collection('news').doc(id).delete();
  }
}