import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  static const routeName = '/rewards';
  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
        backgroundColor: const Color.fromRGBO(58, 12, 163, 1),
      ),
      body: const Center(
          child: Text(
        'Coming in soon!',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
