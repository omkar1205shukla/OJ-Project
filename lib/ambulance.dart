import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medhub/util/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  _AmbulanceState createState() => _AmbulanceState();
}

class Ambulances {
  final String Location;
  final String Name;
  final String Number;

  Ambulances(this.Location, this.Name, this.Number);
}

class _AmbulanceState extends State<Ambulance> {
  String dropdownvalue = "Mumbai";
  final DBref = FirebaseDatabase.instance.reference().child("Ambulance");
  var datas;
  var name = "";

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
        title: const Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 15,
              left: MediaQuery.of(context).size.width * 0.10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                    color: MedCareColors.primaryColor,
                    style: BorderStyle.solid,
                    width: 1),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                    underline: const SizedBox(),
                    style: const TextStyle(
                        color: MedCareColors.primaryColor,
                        fontFamily: 'hpsimplified',
                        fontWeight: FontWeight.bold),
                    iconEnabledColor: MedCareColors.primaryColor,
                    iconDisabledColor: MedCareColors.primaryColor,
                    isExpanded: true,
                    value: dropdownvalue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: <String>[
                      "Mumbai",
                      "Udupi",
                      "Alappuzha",
                      "Delhi",
                      "Hyderabad",
                      "Indore",
                      "Chandigarh",
                      "Ahmedabad",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, textAlign: TextAlign.right),
                      );
                    }).toList()),
              ),
            ),
          ),
          FutureBuilder(
              future: _getValue(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.25),
                    child: const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 0, left: 16.0, right: 16.0),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70) -
                                              48,
                                          child: Text(
                                            snapshot.data[index].Name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.phone),
                                        color: const Color.fromARGB(
                                            255, 232, 56, 77),
                                        onPressed: () {
                                          _launchCaller(
                                              snapshot.data[index].Number);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              })
        ],
      ),
    );
  }

  Future<List<Ambulances>> _getValue() async {
    await DBref.once().then((datasnapShot) {
      datas = datasnapShot.snapshot.value;
    });
    List<Ambulances> ambul = [];

    Map map = datas;
    for (var u in map.values) {
      if (dropdownvalue == u["Location"]) {
        Ambulances ambulance =
            Ambulances(u["Location"], u["Name"], u["Number"]);
        ambul.add(ambulance);
      }
    }

    return ambul;
  }

  _launchCaller(var phoneno) async {
    var url = "tel:$phoneno";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
