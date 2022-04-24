import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/tabs_screen.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore <= 10) {
      resultText = 'These ups and downs are considered normal.';
    } else if (resultScore <= 16) {
      resultText = 'Mild mood disturbance.';
    } else if (resultScore <= 20) {
      resultText = 'Borderline clinical depression.';
    } else if (resultScore <= 30) {
      resultText = 'Moderate depression. Please contact the psychologist.';
    } else if (resultScore <= 40) {
      resultText = 'Severe depression. Please contact the psychologist.';
    } else {
      resultText = 'Extreme depression. Please contact the hospital.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            color: const Color.fromRGBO(37, 22, 199, 1).withOpacity(0.9),
          )
        ],
      ),
    );
  }
}
