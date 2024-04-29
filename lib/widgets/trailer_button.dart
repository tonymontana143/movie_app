import 'package:flutter/material.dart';

class TrailerButton extends StatelessWidget {
  final String trailerLink;

  TrailerButton({required this.trailerLink});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      child: Text('Watch Trailer'),
    );
  }
}
