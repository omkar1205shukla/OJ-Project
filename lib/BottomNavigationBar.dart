import 'package:flutter/material.dart';
import 'package:medhub/HomePage.dart';
import 'package:medhub/Me.dart';
import 'package:medhub/News.dart';
import 'package:medhub/util/colors.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    News(),
    // const Remainder(),
    const HomePage(),
    // const HealthCamps(),
    const Me(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MedCareColors.primaryColor,
        selectedIconTheme:
            const IconThemeData(color: MedCareColors.primaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey[500]),
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.subtitles), label: ("News")),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.calendar_today), label: ("Remainder")),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.local_convenience_store),
          //     label: ("Health Camps")),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Me")),
        ],
      ),
    );
  }
}
