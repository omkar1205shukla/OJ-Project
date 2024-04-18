import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medhub/BottomNavigationBar.dart';
import 'package:medhub/Hosp.dart';
import 'package:medhub/SignUp.dart';
import 'package:medhub/loginpage.dart';
import 'package:medhub/services/local_storage.dart';
import 'package:medhub/util/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.instance.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: MedCareColors.primaryColor,
          secondaryHeaderColor: MedCareColors.primaryColor,
          appBarTheme: const AppBarTheme(
              color: MedCareColors.primaryColor), // Main Color

          fontFamily: 'hpsimplified'),
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        Hosp.routeName: (context) => const Hosp(''),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (LocalStorage.instance.isUserLoggedIn()) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Bottom()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
