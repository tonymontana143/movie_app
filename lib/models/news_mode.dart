import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String author;
  Timestamp date;
  String desc;
  String imgUrl;
  String link;
  String title;

  NewsModel({
    required this.author,
    required this.date,
    required this.desc,
    required this.imgUrl,
    required this.link,
    required this.title
  });

  NewsModel.fromJson(Map<String, Object?> json)
  : this(
    author: json["author"] as String,
    date: json["date"] as Timestamp,
    desc: json["desc"] as String,
    imgUrl: json["img_url"] as String,
    link: json["link"] as String,
    title: json["title"] as String
  );

  NewsModel copyWith({
    String? author,
    Timestamp? date,
    String? desc,
    String? imgUrl,
    String? link,
    String? title
  }){
    return NewsModel(
        author: author ?? this.author,
        date: date ?? this.date,
        desc: desc ?? this.desc,
        imgUrl: imgUrl ?? this.imgUrl,
        link: link ?? this.link,
        title: title ?? this.title);
  }

  Map<String, Object?> toJson() {
    return {
      "author" : author,
      "date" : date,
      "desc" : desc,
      "img_url" : imgUrl,
      "link" : link,
      "title" : title
    };
  }
}

