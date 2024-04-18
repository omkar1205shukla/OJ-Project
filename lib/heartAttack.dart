import 'package:flutter/material.dart';
import 'package:medhub/util/colors.dart';

class HeartAttack extends StatefulWidget {
  const HeartAttack({super.key});

  @override
  _HeartAttackState createState() => _HeartAttackState();
}

class _HeartAttackState extends State<HeartAttack> {
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
        title: const Text("Heart Attack"),
      ),
    );
  }
}
