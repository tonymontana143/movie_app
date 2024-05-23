import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/new_news/news_page.dart';
import 'package:movie_app/pages/movie.dart';

import 'firebase_options.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/pages/login_page.dart';



void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);  
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open the Hive box
  await Hive.openBox('mybox');
  runApp(MyApp(token: prefs.getString('token'),));
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
      theme: ThemeData(

        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  NewsPage(),
    );
  }
}