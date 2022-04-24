import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/tools/games/wordle/wordlescreen.dart';

import 'package:mental_health_app/screens/tools/games/slide%20puzzle/board.dart';

class GamesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  GamesItem(this.id, this.title, this.color);

  void _selectGame(BuildContext ctx) {
    if (title == 'Slide puzzle') {
      Navigator.of(ctx).pushNamed(Board.routeName);
    }
    if (title == 'Wordle') {
      Navigator.of(ctx).pushNamed(WordleScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectGame(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
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
/*
void _wordle() async {
  const url = 'https://www.nytimes.com/games/wordle/index.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
*/