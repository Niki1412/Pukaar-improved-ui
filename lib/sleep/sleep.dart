import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  static const routeName = '/sleep';

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  var hours = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep'),
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Please enter the number of hours you slept yesterday',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter hours',
            ),
          ),
        ],
      ),
    );
  }
}
