import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: const Color.fromRGBO(172, 195, 235, 1),
        textColor: Colors.black,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onPressed: () => selectHandler(),
      ),
    );
  }
}
