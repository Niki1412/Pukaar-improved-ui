import 'package:equatable/equatable.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

//Boardtile class
class BoardTile extends StatelessWidget {
  const BoardTile({
    Key? key,
    required this.letter,
  }) : super(key: key);

  final Letter letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 48,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: letter.backgroundColor,
          border: Border.all(color: letter.borderColor),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        letter.val,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//Letter Class
enum LetterStatus { initial, notinword, inword, correct }

class Letter extends Equatable {
  Letter({
    required this.val,
    required this.status,
  });
  factory Letter.empty() => Letter(val: '', status: LetterStatus.initial);
  final String val;
  final LetterStatus status;

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return const Color.fromARGB(248, 144, 165, 209);
      case LetterStatus.notinword:
        return const Color.fromRGBO(58, 58, 60, 1);
      case LetterStatus.inword:
        return const Color.fromARGB(255, 180, 159, 58);
      case LetterStatus.correct:
        return const Color.fromRGBO(83, 141, 78, 1);
    }
  }

  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.grey;
      default:
        return const Color.fromARGB(0, 143, 65, 65);
    }
  }

  Letter copyWith({
    val,
    status,
  }) {
    return Letter(
      val: this.val,
      status: this.status,
    );
  }

  @override
  List<Object?> get props => [val, status];
}

//Board class

class Board extends StatelessWidget {
  const Board({
    Key? key,
    required this.board,
    required this.flipCardKeys,
  }) : super(key: key);

  final List<Word> board;

  final List<List<GlobalKey<FlipCardState>>> flipCardKeys;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: board
          .asMap()
          .map(
            (i, word) => MapEntry(
              i,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: word.letters
                    .asMap()
                    .map((j, letter) => MapEntry(
                          j,
                          FlipCard(
                            key: flipCardKeys[i][j],
                            flipOnTouch: false,
                            direction: FlipDirection.VERTICAL,
                            front: BoardTile(
                              letter: Letter(
                                val: letter.val,
                                status: LetterStatus.initial,
                              ),
                            ),
                            back: BoardTile(letter: letter),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

//for list of letters
class Word extends Equatable {
  const Word({required this.letters});
  factory Word.fromString(String word) => Word(
      letters: word
          .split('')
          .map((e) => Letter(val: e, status: LetterStatus.initial))
          .toList());

  final List<Letter> letters;
  String get wordString => letters.map((e) => e.val).join();

  void addLetter(String val) {
    final currentIndex = letters.indexWhere((e) => e.val.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter(val: val, status: LetterStatus.initial);
    }
  }

  void removeLetter() {
    final recentLetterIndex = letters.lastIndexWhere((e) => e.val.isNotEmpty);
    if (recentLetterIndex != -1) {
      letters[recentLetterIndex] = Letter.empty();
    }
  }

  @override
  List<Object?> get props => [letters];
}

const List<String> fiveLetterWords = [
  'agony',
  'there',
  'black',
  'board',
  'arise',
  'their',
  'alone',
  'other',
  'wrong',
  'right',
  'after',
  'years',
  'quick',
  'quiet',
  'think',
  'three',
  'seven',
  'fifty',
  'sound',
  'place',
  'water',
  'still',
];
