import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MoviePage(),
    );
  }
}