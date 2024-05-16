import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/news_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:movie_app/pages/movie.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB2fD0MctkvPbpd5oh2iIHw3A4YLnZf7O8",
            authDomain: "movie-application-f6c69.firebaseapp.com",
            projectId: "movie-application-f6c69",
            storageBucket: "movie-application-f6c69.appspot.com",
            messagingSenderId: "854345037383",
            appId: "1:854345037383:web:c08c1f86be538f8cbce362"));
  } else {
    await Firebase.initializeApp();
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString('token'),
  ));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({
    @required this.token,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MoviePage(),
    );
  }
}
