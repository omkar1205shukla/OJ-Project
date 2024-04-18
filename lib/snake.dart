import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class SnakeBite extends StatefulWidget {
  const SnakeBite({super.key});

  @override
  _SnakeBiteState createState() => _SnakeBiteState();
}

class _SnakeBiteState extends State<SnakeBite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MedCareColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("Snake Bite"),
      ),
    );
  }
}
