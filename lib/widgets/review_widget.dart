import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final String name;
  final String avatarUrl;
  final String reviewText;
  final int starsOutOfFive;

  const ReviewWidget({
    Key? key,
    required this.name,
    required this.avatarUrl,
    required this.reviewText,
    required this.starsOutOfFive,
  }) : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool _liked = false;
  int _likeCount = 0;

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.avatarUrl),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4),
                      Text('${widget.starsOutOfFive} / 5'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _liked ? Icons.favorite : Icons.favorite_border,
                          color: _liked ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            _liked = !_liked;
                            if (_liked) {
                              _likeCount++;
                            } else {
                              _likeCount--;
                            }
                          });
                        },
                      ),
                      SizedBox(width: 4),
                      Text('$_likeCount'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(widget.reviewText),
            ],
          ),
        ),
      ],
    ),
  );
}
}