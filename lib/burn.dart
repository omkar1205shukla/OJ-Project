import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class Burn extends StatefulWidget {
  const Burn({super.key});

  @override
  _BurnState createState() => _BurnState();
}

class _BurnState extends State<Burn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: MedCareColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("Fire Burn"),
      ),
    );
  }
}
