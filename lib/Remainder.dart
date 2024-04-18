import 'package:flutter/material.dart';
import 'package:medhub/drawer.dart';

class Remainder extends StatefulWidget {
  const Remainder({super.key});

  @override
  _RemainderState createState() => _RemainderState();
}

class _RemainderState extends State<Remainder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remainder"),
      ),
      drawer: const Drawers(),
    );
  }
}
