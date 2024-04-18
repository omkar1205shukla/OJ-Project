import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medhub/SignUp.dart';
import 'package:medhub/models/user_profile.dart';
import 'package:medhub/services/local_storage.dart';
import 'package:medhub/util/colors.dart';

///import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'BottomNavigationBar.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: MedCareColors.primaryColor,
        body: Container(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: TypewriterAnimatedTextKit(
                    text: const ["MedCare"],
                    speed: const Duration(milliseconds: 1500),
                    totalRepeatCount: 1,
                    textStyle: const TextStyle(
                        fontFamily: 'hpsimplified',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                        icon: Icon(
                          Icons.person,
                          color: MedCareColors.primaryColor,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                      obscureText: true,
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
                Padding(
                  padding: const EdgeInsets.only(left: 170, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      showToast();
                    },
                    child: const Text(
                      "forgot password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 20),
                        child: ButtonTheme(
                          minWidth: 250,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.red),
                              ),
                            ),
                            onPressed: () async {
                              if (_password != null) {
                                setState(() {
                                  showSpinner = true;
                                });
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((value) {
                                  LocalStorage.instance.setUserLoggedIn();
                                  LocalStorage.instance.saveUserProfile(
                                      UserProfile(email: _email));
                                  setState(() {
                                    _email = "";
                                    _password = "";
                                    showSpinner = false;
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Bottom()),
                                  );
                                }).catchError((e) {
                                  log(e.toString());
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Email or Password is Invalid",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: Colors.white,
                                      textColor: Colors.red,
                                      fontSize: 16.0);
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Email and Password is required",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.red,
                                    fontSize: 16.0);
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: MedCareColors.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 220),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            child: const Text(
                              "Or SignUp",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: "hpsimplified"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignUpPage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
*/

  @override
  void showToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  }
}
