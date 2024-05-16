import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String author;
  Timestamp date; // Change type to Timestamp
  String description;
  String imgUrl;
  String readMoreLink;
  String title;

  NewsModel({
    required this.author,
    required this.date,
    required this.description,
    required this.imgUrl,
    required this.readMoreLink,
    required this.title,
  });

  // Constructor to create NewsModel from JSON data
  NewsModel.fromJson(Map<String, dynamic> json)
      : this(
          author: json["author"] as String,
          date: json["date"] as Timestamp, // Use Timestamp type here
          description: json["description"] as String,
          imgUrl: json["imgUrl"] as String,
          readMoreLink: json["readMoreLink"] as String,
          title: json["title"] as String,
        );

  // Convert NewsModel to JSON data
  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "date": date, // Use Timestamp type here
      "description": description,
      "imgUrl": imgUrl,
      "readMoreLink": readMoreLink,
      "title": title,
    };
  }

  // Convert DateTime to Timestamp
  static Timestamp convertDateTimeToTimestamp(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}
