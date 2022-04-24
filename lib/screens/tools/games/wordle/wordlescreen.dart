import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/tools/games/wordle/wordle.dart';

enum GameStatus { playing, submitting, lost, won }

class WordleScreen extends StatefulWidget {
  const WordleScreen({Key? key}) : super(key: key);
  static const routeName = '/wordle-screen';

  @override
  State<WordleScreen> createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
    6,
    (_) => Word(letters: List.generate(5, (_) => Letter.empty())),
  );

  final List<List<GlobalKey<FlipCardState>>> _flipCardKeys = List.generate(
    6,
    (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()),
  );

  int _currentWordIndex = 0;
  Word? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  Word _solution = Word.fromString(
      fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
        elevation: 0,
        title: const Text(
          "Wordle",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Board(board: _board, flipCardKeys: _flipCardKeys),
          const SizedBox(height: 80),
          Keyboard(
            onKeyTapped: _onKeyTapped,
            onDeleteTapped: _onDeleteTapped,
            onEnterTapped: _onEnterTapped,
            letters: _keyboardLetters,
          ),
        ],
      ),
    );
  }

  void _onKeyTapped(String val) {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.addLetter(val));
    }
  }

  void _onDeleteTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.removeLetter());
    }
  }

  Future<void> _onEnterTapped() async {
    if (_gameStatus == GameStatus.playing &&
        _currentWord != null &&
        !_currentWord!.letters.contains(Letter.empty())) {
      _gameStatus = GameStatus.submitting;

      for (var i = 0; i < _currentWord!.letters.length; i++) {
        final currentWordLetter = _currentWord!.letters[i];
        final currentSolutionletter = _solution.letters[i];

        setState(() {
          if (currentWordLetter == currentSolutionletter) {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.correct);
          } else if (_solution.letters.contains(currentWordLetter)) {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.inword);
          } else {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.notinword);
          }
        });

        final letter = _keyboardLetters.firstWhere(
          (e) => e.val == currentWordLetter.val,
          orElse: () => Letter.empty(),
        );
        if (letter.status != LetterStatus.correct) {
          _keyboardLetters.removeWhere((e) => e.val == currentWordLetter.val);
          _keyboardLetters.add(_currentWord!.letters[i]);
        }
        await Future.delayed(
          const Duration(milliseconds: 150),
          (() =>
              _flipCardKeys[_currentWordIndex][i].currentState?.toggleCard()),
        );
      }

      _checkIfWinOrLoss();
    }
  }

  void _checkIfWinOrLoss() {
    if (_currentWord!.wordString == _solution.wordString) {
      _gameStatus = GameStatus.won;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: const Color.fromRGBO(83, 141, 78, 1),
          content: const Text(
            'You Won!!',
            style: TextStyle(color: Colors.white),
          ),
          action: SnackBarAction(
              onPressed: _restart, textColor: Colors.white, label: 'New Game'),
        ),
      );
    } else if (_currentWordIndex + 1 >= _board.length) {
      _gameStatus = GameStatus.lost;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: const Color.fromRGBO(83, 141, 78, 1),
          content: Text(
            'You lost!! Solution: ${_solution.wordString}',
            style: const TextStyle(color: Color.fromARGB(255, 240, 18, 18)),
          ),
          action: SnackBarAction(
              onPressed: _restart, textColor: Colors.white, label: 'New Game'),
        ),
      );
    } else {
      _gameStatus = GameStatus.playing;
    }
    _currentWordIndex += 1;
  }

  void _restart() {
    setState(() {
      _gameStatus = GameStatus.playing;
      _currentWordIndex = 0;
      _board
        ..clear()
        ..addAll(
          List.generate(
            6,
            (_) => Word(letters: List.generate(5, (_) => Letter.empty())),
          ),
        );
      _solution = Word.fromString(
        fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase(),
      );
      _flipCardKeys
        ..clear()
        ..addAll(
          List.generate(
            6,
            (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()),
          ),
        );

      _keyboardLetters.clear();
    });
  }

  final Set<Letter> _keyboardLetters = {};
}

//Keyboard class

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
    required this.letters,
  }) : super(key: key);

  final void Function(String) onKeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _qwerty
          .map(
            (keyRow) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: keyRow.map(
                (letter) {
                  if (letter == 'DEL') {
                    return _KeyboardButton.delete(
                        onTap: onDeleteTapped); //separate function made
                  } else if (letter == 'ENTER') {
                    return _KeyboardButton.enter(
                        onTap: onEnterTapped); //separate function made
                  }

                  final letterKey = letters.firstWhere(
                    (e) => e.val == letter,
                    orElse: () => Letter.empty(),
                  );

                  return _KeyboardButton(
                    onTap: () => onKeyTapped(letter),
                    letter: letter,
                    backgroundColor: letterKey != Letter.empty()
                        ? letterKey.backgroundColor
                        : Color.fromARGB(255, 99, 91, 104),
                  );
                },
              ).toList(),
            ),
          )
          .toList(),
    );
  }
}

class _KeyboardButton extends StatelessWidget {
  const _KeyboardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
  }) : super(key: key);

  factory _KeyboardButton.delete({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
        width: 56,
        onTap: onTap,
        backgroundColor: const Color.fromARGB(255, 192, 4, 4),
        letter: 'DEL',
      );

  factory _KeyboardButton.enter({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
        width: 56,
        onTap: onTap,
        backgroundColor: const Color.fromARGB(255, 42, 172, 10),
        letter: 'ENTER',
      );

  final double height;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 2.0,
      ),
      child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Text(
                letter,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          )),
    );
  }
}
