import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text('$starsOutOfFive / 5'),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(reviewText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
