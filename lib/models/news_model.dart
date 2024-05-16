import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String author;
  Timestamp date;
  String description; // Changed from desc
  String imgUrl; // Changed from img_url
  String readMoreLink; // Changed from link
  String title;

  NewsModel({
    required this.author,
    required this.date,
    required this.description,
    required this.imgUrl,
    required this.readMoreLink,
    required this.title
  });

  NewsModel.fromJson(Map<String, Object?> json)
      : this(
      author: json["author"] as String,
      date: json["date"] as Timestamp,
      description: json["description"] as String, // Changed from desc
      imgUrl: json["imgUrl"] as String, // Changed from img_url
      readMoreLink: json["readMoreLink"] as String, // Changed from link
      title: json["title"] as String
  );

  Map<String, Object?> toJson() {
    return {
      "author" : author,
      "date" : date,
      "description" : description, // Changed from desc
      "imgUrl" : imgUrl, // Changed from img_url
      "readMoreLink" : readMoreLink, // Changed from link
      "title" : title
    };
  }
}
