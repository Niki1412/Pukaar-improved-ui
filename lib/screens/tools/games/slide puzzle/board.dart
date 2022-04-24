import 'package:flutter/material.dart';

import 'package:mental_health_app/screens/tools/games/slide puzzle/grid.dart';

class Board extends StatefulWidget {
  static const routeName = '/board';

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int moves = 0;

  @override
  void initState() {
    numbers.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Puzzle'),
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Container(
              width: 380,
              height: 440.5,
              color: Colors.indigo,
              child: Column(
                children: <Widget>[
                  Grid(numbers, size, clickGrid),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => reset(),
                          child: const Text("Reset"),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Text(
                          'Moves : $moves',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        moves++;
      });
    }
    checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      moves = 0;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 0; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'You Win!!',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
