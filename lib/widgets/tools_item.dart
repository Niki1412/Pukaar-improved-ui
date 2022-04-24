import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mental_health_app/relaxing%20music/music_screen.dart';
import 'package:mental_health_app/screens/self%20test/self_test.dart';
import 'package:mental_health_app/screens/tools/games/games_screen.dart';
import 'package:mental_health_app/screens/rewards_screen.dart';

class ToolsItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  ToolsItem(this.id, this.title, this.color);

  void _selectTool(BuildContext ctx) {
    if (title == 'Games') {
      Navigator.of(ctx).pushNamed(GamesScreen.routeName);
    }
    if (title == 'Rewards') {
      Navigator.of(ctx).pushNamed(Rewards.routeName);
    }
    if (title == 'Self Test') {
      Navigator.of(ctx).pushNamed(SelfTest.routeName);
    }
    if (title == 'Relaxing Music') {
      // _music();
      Navigator.of(ctx).pushNamed(MusicScreen.routeName);
    }
    if (title == 'Daily Routine') {
      _dailyRoutine();
    }
    if (title == 'Your Thoughts') {
      _yourThoughts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectTool(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              /*  if (title == 'Games' || title == 'Relaxing Music' || title == 'Daily Routine') {
                color: Colors.white;
              }
              else
                  {
                    color: Colors.black;
                  }*/
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

void _music() async {
  const url =
      'https://open.spotify.com/track/6kkwzB6hXLIONkEk9JciA6?si=mqm24mEDRGOpjE2A16OuIw&nd=1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _dailyRoutine() async {
  const url = 'https://flask.io/new';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _yourThoughts() async {
  const url = 'https://myjournalate.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
