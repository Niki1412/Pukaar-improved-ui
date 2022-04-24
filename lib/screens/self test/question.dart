import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String quesText;

  Question(this.quesText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(50),
      child: Text(
        quesText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
