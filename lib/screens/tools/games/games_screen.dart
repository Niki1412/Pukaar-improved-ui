import 'package:flutter/material.dart';

import 'package:mental_health_app/games_dummy_data.dart';
import 'package:mental_health_app/widgets/games_items.dart';

class GamesScreen extends StatelessWidget {
  static const routeName = '/games-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
      ),
      body: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(25),
        children: GAMES_DUMMY
            .map(
              (toolData) => GamesItem(
                toolData.id,
                toolData.title,
                toolData.color,
              ),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
