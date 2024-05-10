import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login_page.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/config.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async{
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){

      var regBody = {
        "email":emailController.text,
        "password":passwordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(regBody)
      );

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if(jsonResponse['status']){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
      }else{
        print("SomeThing Went Wrong");
      }
    }else{
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(

                colors: [Color(0XFF3A6073),Color(0xFF16222A)],

                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,0.8],
                tileMode: TileMode.mirror
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HeightBox(10),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                        "CREATE YOUR ACCOUNT",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFEEEEEE),
                          fontSize: 28
                        )
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontFamily: "Poppins",
                          fontSize: 14,
                          letterSpacing: 1.1
                      ),
                    decoration: InputDecoration(
                        filled: false,
                        errorStyle: const TextStyle(color: Colors.white),
                        errorText: _isNotValidate ? "Enter Proper Info" : null,
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontFamily: "Poppins",
                          fontSize: 14,
                          letterSpacing: 1.1
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ).p4().px24(),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Color(0xFFEEEEEE),
                        fontFamily: "Poppins",
                        fontSize: 14,
                        letterSpacing: 1.1
                    ),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(icon: Icon(Icons.copy),onPressed: (){
                          final data = ClipboardData(text: passwordController.text);
                          Clipboard.setData(data);
                        },),
                        prefixIcon: IconButton(icon: Icon(Icons.password),onPressed: (){
                          String passGen =  generatePassword();
                          passwordController.text = passGen;
                          setState(() {

                          });
                        },),
                        filled: false,
                        errorStyle: const TextStyle(color: Colors.white),
                        errorText: _isNotValidate ? "Enter Proper Info" : null,
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontFamily: "Poppins",
                            fontSize: 14,
                            letterSpacing: 1.1
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 100.0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))
                    ,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                            color: Color(0XFF3A6073)
                              , // Change the color of the border when focused
                      ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    ),

                  ).p4().px24(),
                  HStack([
                    GestureDetector(
                      onTap: ()=>{
                        registerUser()
                      },
                      child: VxBox(child: "Register".text.white.makeCentered().p16()).green600.roundedLg.make().px16().py16(),
                    ),
                  ]),
                  GestureDetector(
                    onTap: (){
                      print("Sign In");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                    },
                    child: HStack([

                      "Already Registered?".text.red800.make(),
                      " Sign In".text.white.make()
                    ]).centered(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String generatePassword() {
  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '1234567890';
  String symbols = '!@#\$%^&*()<>,./';

  String password = '';

  int passLength = 20;

  String seed = upper + lower + numbers + symbols;

  List<String> list = seed.split('').toList();

  Random rand = Random();

  for (int i = 0; i < passLength; i++) {
    int index = rand.nextInt(list.length);
    password += list[index];
  }
  return password;
}
