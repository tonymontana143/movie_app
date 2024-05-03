// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerButton extends StatelessWidget {
  final String trailerLink;

  const TrailerButton({super.key, required this.trailerLink});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchURL(trailerLink);
      },
      child: const Text('Watch Trailer'),
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
