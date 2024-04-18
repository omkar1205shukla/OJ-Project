import 'package:flutter/material.dart';
import 'package:medhub/ambulance.dart';
import 'package:medhub/bloodbank.dart';
import 'package:medhub/diagnostic.dart';
/*import 'package:medhub/src/global_bloc.dart';
import 'package:medhub/src/ui/homepage/homepage.dart';
import 'package:provider/provider.dart';*/
import 'package:medhub/drawer.dart';
import 'package:medhub/pharmacy.dart';
import 'package:medhub/specialist.dart';

void Home() {
  const HomePage();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedCare'),
      ),
      drawer: const Drawers(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        // padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Specialist()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage("images/hospital.png"),
                    height: 90,
                    width: 90,
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: const Text(
                        "Hospital ",
                        style:
                            TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
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
                    builder: (BuildContext context) => const DiagnosticLab()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/pathology.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Diagnostic Lab ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Pharmacy()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/pharmacy.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Pharmacy ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const BloodBank()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/blood_bank.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Blood Bank ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Ambulance()),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/schemes.png"),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      "Ambulance ",
                      style:
                          TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
                    ),
                  ],
                )),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (BuildContext context) => const MaternalCare()),
          //     );
          //   },
          //   child: Card(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(15.0),
          //       ),
          //       child: const Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: <Widget>[
          //           Image(
          //             image: AssetImage("images/maternity.png"),
          //             height: 90,
          //             width: 90,
          //           ),
          //           Text(
          //             "Maternity ",
          //             style:
          //                 TextStyle(fontFamily: 'hpsimplified', fontSize: 16),
          //           ),
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}
