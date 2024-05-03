// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final String name;
  final String avatarUrl;
  final String reviewText;
  final int starsOutOfFive;

  // ignore: use_super_parameters
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
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
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
                      const SizedBox(width: 4),
                      Text('$_likeCount'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(widget.reviewText),
            ],
          ),
        ),
      ],
    ),
  );
}
}