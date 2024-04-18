import 'package:flutter/material.dart';
import 'package:medhub/Hosp.dart';

class Specialist extends StatefulWidget {
  const Specialist({super.key});

  @override
  _SpecialistState createState() => _SpecialistState();
}

class _SpecialistState extends State<Specialist> {
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
        title: const Text('Hospital'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 5),
              child: const Text(
                "Select Specialist : -",
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Cardiologist")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Cardiologist.png",
                      ),
                    ),
                    title: const Text("Cardiologist"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Dentist")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Dentist.png",
                      ),
                    ),
                    title: const Text("Dentist"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("ENT")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Ent.png",
                      ),
                    ),
                    title: const Text("ENT"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Gynaecologist")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Gyno.png",
                      ),
                    ),
                    title: const Text("Gynaecologist"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Neurologist")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/neurologist.png",
                      ),
                    ),
                    title: const Text("Neurologist"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Oncologist")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Onco.png",
                      ),
                    ),
                    title: const Text("Oncologist"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Hosp("Gastroenterologists")),
                      );
                    },
                    leading: Tab(
                      icon: Image.asset(
                        "images/Gast.png",
                      ),
                    ),
                    title: const Text("Gastroenterologists"),
                  ),
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
