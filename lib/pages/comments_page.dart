import 'package:flutter/material.dart';
import 'package:movie_app/widgets/review_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsListPage extends StatelessWidget {
  const CommentsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        color: Color(0xFF132C33), // Deep blue background color
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'User Comments',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ReviewWidget(
                name: 'John Doe',
                avatarUrl: 'https://example.com/avatar.jpg',
                reviewText: 'Great movie! Highly recommended.',
                starsOutOfFive: 5,
              ),
              SizedBox(height: 20),
              ReviewWidget(
                name: 'Jane Smith',
                avatarUrl: 'https://example.com/avatar.jpg',
                reviewText: 'Average movie. Could be better.',
                starsOutOfFive: 3,
              ),
              SizedBox(height: 20),
              ReviewWidget(
                name: 'Alice Johnson',
                avatarUrl: 'https://example.com/avatar.jpg',
                reviewText: 'Disappointing. Expected more.',
                starsOutOfFive: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
