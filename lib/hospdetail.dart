import 'package:flutter/material.dart';
import 'package:medhub/Hosp.dart';
import 'package:medhub/appointment.dart';
import 'package:medhub/util/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetail extends StatefulWidget {
  final Hosps user;
  final String speciality;
  const HospitalDetail(this.user, this.speciality, {super.key});
  static const routeName = '/hosp-detail';
  @override
  State<HospitalDetail> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
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
        title: const Text('Hospitals'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 20, left: 16.0, right: 16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(widget.user.Photo),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.65) - 72,
                        child: Text(widget.user.Name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.language),
                      color: MedCareColors.primaryColor,
                      onPressed: () {
                        _launchURL(widget.user.Website);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      color: MedCareColors.primaryColor,
                      onPressed: () {
                        _launchCaller(widget.user.Contact);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.location_on),
                      color: MedCareColors.primaryColor,
                      onPressed: () {
                        openMap(widget.user.Loc);
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(widget.user.Address,
                      style: const TextStyle(fontSize: 16)),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: const Text("About",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(widget.user.About,
                      style: const TextStyle(fontSize: 16)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: const Text("Facilities",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(widget.user.Facilities,
                      style: const TextStyle(fontSize: 16)),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BookAppointment(
                                      widget.user.Name, widget.speciality)),
                        );
                      },
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: new BorderRadius.circular(18.0),
                      //     side: BorderSide(color: Colors.red)),
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
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openMap(var link) async {
    String googleUrl = link;
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  _launchCaller(var phoneno) async {
    var url = "tel:$phoneno";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL(var link) async {
    var url = link;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
