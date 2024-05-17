class Comment {
  final String id;
  final String text;

  Comment({required this.id, required this.text});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['_id'] as String,
        text: json['text'] as String,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'text': text,
      };
}