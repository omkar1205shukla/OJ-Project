import 'package:flutter/material.dart';
import 'package:medhub/drawer.dart';

class HealthCamps extends StatelessWidget {
  const HealthCamps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Camps"),
      ),
      drawer: const Drawers(),
      body: const Center(
        child: Text("Health Section"),
      ),
    );
  }
}
