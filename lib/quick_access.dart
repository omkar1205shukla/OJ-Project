import 'package:flutter/material.dart';
import 'package:medhub/bone.dart';
import 'package:medhub/burn.dart';
import 'package:medhub/heartAttack.dart';
import 'package:medhub/snake.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  _QuickAccessState createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("Quick Access"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 160),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SnakeBite()),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("images/snake.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: const Text(
                          "Snake Bite ",
                          style: TextStyle(
                              fontFamily: 'hpsimplified', fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Burn()),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("images/fire.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: const Text(
                          "Burns ",
                          style: TextStyle(
                              fontFamily: 'hpsimplified', fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const BoneFracture()),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("images/bone.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: const Text(
                          "Bone Fracture ",
                          style: TextStyle(
                              fontFamily: 'hpsimplified', fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HeartAttack()),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("images/heartattack.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: const Text(
                          "Heart Attack ",
                          style: TextStyle(
                              fontFamily: 'hpsimplified', fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
