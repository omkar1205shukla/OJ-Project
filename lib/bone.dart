import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class BoneFracture extends StatefulWidget {
  const BoneFracture({super.key});

  @override
  _BoneFractureState createState() => _BoneFractureState();
}

class _BoneFractureState extends State<BoneFracture> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, // Main Color,

          fontFamily: 'hpsimplified'),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MedCareColors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: const Text("Bone Fracture"),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: const Column(
            children: <Widget>[
              Text(
                "What to do?",
                style: TextStyle(
                    fontFamily: 'hpsimplified',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 92, 91, 87)),
              ),
              Text("Stop Any bleeding"),
              Text("Immobolize the injured area."),
              Wrap(
                children: <Widget>[
                  Text("Apply ice Packs to limit swelling and help relive pain")
                ],
              ),
              Text("Treat for shock")
            ],
          ),
        ),
      ),
    );
  }
}
