import 'dart:convert';
import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/config.dart';
import 'movie.dart'; // Import the MoviePage widget

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MoviePage()), // Navigate to MoviePage
        );
      } else {
        print('Something went wrong');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0XFF132C33), const Color(0XFF132C33)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomCenter,
            stops: [0.0, 0.8],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HeightBox(10),
                "Email Sign-In".text.size(22).yellow100.make(),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    errorText: _isNotValidate ? "Enter Proper Info" : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ).p4().px24(),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    errorText: _isNotValidate ? "Enter Proper Info" : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ).p4().px24(),
                GestureDetector(
                  onTap: () {
                    loginUser();
                  },
                  child: HStack([
                    VxBox(child: "LogIn".text.white.makeCentered().p16()).green600.roundedLg.make(),
                  ]),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                  },
                  child: "Create a new Account..! Sign Up".text.white.makeCentered(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
