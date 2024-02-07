import 'package:flutter/material.dart';

class Baterie extends StatefulWidget {
  const Baterie({super.key});

  @override
  State<Baterie> createState() => _BaterieState();
}

class _BaterieState extends State<Baterie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Baterie"),
    );
  }
}
