import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class BookAppointment extends StatefulWidget {
  final String name;
  final String speciality;

  const BookAppointment(this.name, this.speciality, {super.key});
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("User Profile"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                "Enter Your Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Mobile No',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Time',
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Book an Appointment",
                    style: TextStyle(
                      fontFamily: "hpsimplified",
                      color: MedCareColors.primaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
