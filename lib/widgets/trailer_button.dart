import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerButton extends StatelessWidget {
  final String trailerLink;

  const TrailerButton({Key? key, required this.trailerLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchURL(trailerLink);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Make button background transparent
        shadowColor: Colors.transparent, // Make button shadow transparent
        elevation: 0, // Remove the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set the button shape
        ),
      ),
      child: Text(
        'Watch Trailer',
        style: TextStyle(
          fontFamily: "Poppins",
          color: Color(0xFFEEEEEE),
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // Function to launch the URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
