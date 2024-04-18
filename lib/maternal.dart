import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class MaternalCare extends StatelessWidget {
  const MaternalCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: MedCareColors.primaryColor, // Main Color
          fontFamily: 'hpsimplified'),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: const Text('Home Page'),
        ),
        body: const Center(
          child: Text("Maternal Care"),
        ),
      ),
    );
  }
}
