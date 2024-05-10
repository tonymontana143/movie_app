import 'dart:convert';
import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/config.dart';
import 'movie.dart'; // Import the MoviePage widget
import 'package:logger/logger.dart';

final logger = Logger();

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

      try {
        var response = await http.post(Uri.parse(login),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody));

        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status']) {
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          logger.i('User logged in successfully'); // Info level log
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MoviePage()),
          );
        } else {
          logger.w('Login failed'); // Warning level log
          print('Something went wrong');
        }
      } catch (error) {
        logger.e('Error during login: $error'); // Error level log
      }
    } else {
      logger.w('Email or password is empty'); // Warning level log
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF3A6073), const Color(0xFF16222A)],
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
                  "Email Sign-In".text.size(22).white.make(),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      letterSpacing: 1.1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 14,
                        letterSpacing: 1.1,
                      ),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ).p4().px24(),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      letterSpacing: 1.1,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 14,
                        letterSpacing: 1.1,
                      ),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
          },
          child: Container(
            height: 25,
            color: Colors.lightBlue,
            child: Center(child: "Create a new Account..! Sign Up".text.white.makeCentered()),
          ),
        ),
      ),
    );
  }
}
