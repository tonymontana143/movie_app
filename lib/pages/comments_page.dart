import 'package:flutter/material.dart';
import 'package:movie_app/widgets/review_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsListPage extends StatelessWidget {
  // ignore: use_super_parameters
  const CommentsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Container(
        color: const Color(0xFF132C33), // Deep blue background color
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
            const ReviewWidget(
              name: 'John Doe',
              avatarUrl: 'https://example.com/avatar.jpg',
              reviewText: 'Great movie! Highly recommended.',
              starsOutOfFive: 5,
            ),
            const SizedBox(height: 20),
            const ReviewWidget(
              name: 'Jane Smith',
              avatarUrl: 'https://example.com/avatar.jpg',
              reviewText: 'Average movie. Could be better.',
              starsOutOfFive: 3,
            ),
            const SizedBox(height: 20),
            const ReviewWidget(
              name: 'Alice Johnson',
              avatarUrl: 'https://example.com/avatar.jpg',
              reviewText: 'Disappointing. Expected more.',
              starsOutOfFive: 2,
            ),
            const SizedBox(height: 20),
            Text(
              'Add Your Comment:',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your comment here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
