import 'package:flutter/material.dart';

class HealthSchemes extends StatefulWidget {
  const HealthSchemes({super.key});

  @override
  _HealthSchemesState createState() => _HealthSchemesState();
}

class _HealthSchemesState extends State<HealthSchemes> {
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
      body: Container(
        child: const Center(
          child: Text("Health Schemes"),
        ),
      ),
    );
  }
}
