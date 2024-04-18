import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medhub/loginpage.dart';
import 'package:medhub/util/colors.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-page';
  const SignUpPage({super.key});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MedCareColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("Sign Up"),
      ),
      body: Container(
        color: MedCareColors.primaryColor,
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Column(children: <Widget>[
          const Text("MedCare",
              style: TextStyle(
                  fontFamily: 'hpsimplified',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.person),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  icon: Icon(Icons.lock),
                )),
          ),
          Center(
              child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: ButtonTheme(
              minWidth: 250,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
                onPressed: () {
                  print(_email);
                  print(_password);
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((value) {
                    setState(() {
                      _email = "";
                      _password = "";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage()),
                    );
                  }).catchError((e) {
                    Fluttertoast.showToast(
                        msg: "Account Already Exists",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        fontSize: 16.0);
                  });
                },
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MedCareColors.primaryColor),
                ),
              ),
            ),
          )),
        ]),
      ),
    );
  }
}
