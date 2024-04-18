import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medhub/drawer.dart';
import 'package:medhub/util/colors.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  String dropdownvalue = "A+ve";
  var _height = 0;
  var _weight = 0;
  var datavalue = "";
  var underweight = "";
  var check = 0;
  void BmiCalculate() {
    var value = _weight / pow(_height / 100, 2);
    setState(() {
      datavalue = value.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      drawer: const Drawers(),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/user.png")))),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text("MedCare"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age (in years)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _height = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Height (in cms)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Weight (in kgs)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Text("BMI :-     "),
                Text(
                  "$datavalue    ",
                ),
                Text(
                  underweight,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text("Blood Groups :-    "),
                // DropdownButton<String>(
                //     value: dropdownvalue,
                //     onChanged: (String newValue) {
                //       setState(() {
                //         dropdownvalue = newValue;
                //       });
                //     },
                //     items: <String>[
                //       "A+ve",
                //       "A-ve",
                //       "B+ve",
                //       "B-ve",
                //       "O+ve",
                //       "O-ve",
                //       "AB+ve",
                //       "AB-ve"
                //     ].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList())
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                setState(() {
                  BmiCalculate();
                  OverAndUnder();
                });
              },
              // shape: RoundedRectangleBorder(
              //     borderRadius: new BorderRadius.circular(18.0),
              //     side: BorderSide(color: Colors.red)),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontFamily: "hpsimplified",
                  color: MedCareColors.primaryColor,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  void OverAndUnder() {
    setState(() {
      if (int.parse(datavalue) >= 25) {
        underweight = "[ Overweight ]";
      } else if (int.parse(datavalue) >= 18.5) {
        underweight = "[ Normal ]";
      } else {
        underweight = "[ Underweight ]";
      }
    });
  }
}
