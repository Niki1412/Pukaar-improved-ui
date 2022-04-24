import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(12),
          child: FlatButton(
            height: 100,
            color: Color.fromRGBO(67, 97, 238, 1),
            child: Center(
              child: Text(
                'Depression',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: _depression,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: FlatButton(
            height: 100,
            color: Color.fromRGBO(72, 149, 255, 1),
            child: Center(
              child: Text(
                'Anxiety',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: _anxiety,
          ),
        ),
      ],
    );
  }
}

void _depression() async {
  const url =
      'https://drive.google.com/drive/folders/1q4Fp5f8fszYgZtPwqTdFU_EBTChAzbmi?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _anxiety() async {
  const url =
      'https://drive.google.com/drive/u/1/folders/1CDDUnc9WKn9sJHooDlKL9JovnQDnKzyq';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
