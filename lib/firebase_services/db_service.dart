import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/news_model.dart';

const String NEWS_COLLECTION_REF = "news";

class DBService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _newsRef;

  DBService() {
    _newsRef = _firestore.collection(NEWS_COLLECTION_REF)
        .withConverter<NewsModel>(fromFirestore: (snapshots, _) =>
          NewsModel.fromJson(snapshots.data()!),
        toFirestore: (news, _) => news.toJson()
    );
  }

  Stream<QuerySnapshot> getNews() {
    return _newsRef.snapshots();
  }

  void addNews(NewsModel news) async {
    _newsRef.add(news);
  }

  void updateNews(String id, NewsModel news) async {
    _newsRef.doc(id).update(news.toJson());
  }

  void deleteNews(String id) async {
    _newsRef.doc(id).delete();
  }
}