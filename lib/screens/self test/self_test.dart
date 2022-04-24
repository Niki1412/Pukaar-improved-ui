import 'package:flutter/material.dart';

import 'package:mental_health_app/screens/self%20test/quiz.dart';
import 'package:mental_health_app/screens/self%20test/result.dart';

class SelfTest extends StatefulWidget {
  static const routeName = '/self-test';

  @override
  State<SelfTest> createState() => _SelfTestState();
}

class _SelfTestState extends State<SelfTest> {
  final _questionsDepression = const [
    {
      'questionText': 'How are you feeling today?',
      'answers': [
        {'text': 'I do not feel sad. ', 'score': 0},
        {'text': 'I feel sad ', 'score': 1},
        {
          'text': 'I am sad all the time and I can\'t snap out of it. ',
          'score': 2
        },
        {
          'text': 'I am so sad and unhappy that I can\'t stand it. ',
          'score': 3
        },
      ],
    },
    {
      'questionText': 'How motivated do you feel about your future?',
      'answers': [
        {
          'text': 'I am not particularly discouraged about the future.',
          'score': 0
        },
        {'text': 'I feel discouraged about the future', 'score': 1},
        {'text': 'I feel I have nothing to look forward to.', 'score': 2},
        {
          'text':
              'I feel the future is hopeless and that things cannot improve',
          'score': 3
        },
      ],
    },
    {
      'questionText': 'Do you feel like a failure?',
      'answers': [
        {'text': 'I do not feel like a failure', 'score': 0},
        {
          'text': 'I feel I have failed more than the average person',
          'score': 1
        },
        {
          'text': 'As I look back on my life, all I can see is a lot failures',
          'score': 2
        },
        {'text': 'I feel I am a complete failure as a person', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you satisfied with the activities you do?',
      'answers': [
        {
          'text': 'I get as much satisfaction out of things as I used to.',
          'score': 0
        },
        {'text': 'I don\'t enjoy things the way I used to. ', 'score': 1},
        {
          'text': 'I don\'t get real satisfaction out of anything anymore. ',
          'score': 2
        },
        {'text': 'I am dissatisfied or bored with everything. ', 'score': 3},
      ],
    },
    {
      'questionText': 'Do you feel guilty about anything?',
      'answers': [
        {'text': 'I don\'t feel particularly guilty ', 'score': 0},
        {'text': 'I feel guilty a good part of the time. ', 'score': 1},
        {'text': 'I feel quite guilty most of the time. ', 'score': 2},
        {'text': 'I feel guilty all of the time.', 'score': 3},
      ],
    },
    {
      'questionText': 'Do you feel that you are being punished?',
      'answers': [
        {'text': 'I don\'t feel I am being punished.', 'score': 0},
        {'text': 'I feel I may be punished.', 'score': 1},
        {'text': 'I expect to be punished.', 'score': 2},
        {'text': 'I feel I am being punished.', 'score': 3},
      ],
    },
    {
      'questionText': 'How do you feel about yourself?',
      'answers': [
        {'text': 'I don\'t feel disappointed in myself.', 'score': 0},
        {'text': 'I am disappointed in myself.', 'score': 1},
        {'text': 'I am disgusted with myself.', 'score': 2},
        {'text': 'I hate myself.', 'score': 3},
      ],
    },
    {
      'questionText': 'Do you blame yourself for everything?',
      'answers': [
        {'text': 'I don\'t feel I am any worse than anybody else', 'score': 0},
        {
          'text': 'I am critical of myself for my weaknesses or mistakes.',
          'score': 1
        },
        {'text': 'I blame myself all the time for my faults.', 'score': 2},
        {'text': 'I blame myself for everything bad that happens.', 'score': 3},
      ],
    },
    {
      'questionText': 'Do you get suicidal thoughts?',
      'answers': [
        {'text': 'I don\'t have any thoughts of killing myself. ', 'score': 0},
        {
          'text':
              'I have thoughts of killing myself, but I would not carry them out. ',
          'score': 1
        },
        {'text': 'I would like to kill myself.', 'score': 2},
        {'text': 'I would kill myself if I had the chance.', 'score': 3},
      ],
    },
    {
      'questionText': 'How often do you cry?',
      'answers': [
        {'text': 'I don\'t cry any more than usual.', 'score': 0},
        {'text': 'I cry more now than I used to.', 'score': 1},
        {'text': 'I cry all the time now.', 'score': 2},
        {
          'text':
              'I used to be able to cry, but now I can\'t cry even though I want to.',
          'score': 3
        },
      ],
    },
    {
      'questionText': 'How often do you feel irritated?',
      'answers': [
        {
          'text': 'I am no more irritated by things than I ever was.',
          'score': 0
        },
        {'text': 'I am slightly more irritated now than usual.', 'score': 1},
        {
          'text': 'I am quite annoyed or irritated a good deal of the time.',
          'score': 2
        },
        {'text': 'I feel irritated all the time.', 'score': 3},
      ],
    },
    {
      'questionText': 'Have you lost interest in other people?',
      'answers': [
        {'text': 'I have not lost interest in other people.', 'score': 0},
        {
          'text': 'I am less interested in other people than I used to be.',
          'score': 1
        },
        {
          'text': 'I have lost most of my interest in other people.',
          'score': 2
        },
        {'text': 'I have lost all of my interest in other people.', 'score': 3},
      ],
    },
    {
      'questionText': 'Do you find decision making difficult?',
      'answers': [
        {'text': 'I make decisions about as well as I ever could.', 'score': 0},
        {'text': 'I put off making decisions more than I used to.', 'score': 1},
        {
          'text':
              'I have greater difficulty in making decisions more than I used to.',
          'score': 2
        },
        {'text': 'I can\'t make decisions at all anymore.', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you worried about your looks or appearance?',
      'answers': [
        {
          'text': 'I don\'t feel that I look any worse than I used to.',
          'score': 0
        },
        {
          'text': 'I am worried that I am looking old or unattractive.',
          'score': 1
        },
        {
          'text':
              'I feel there are permanent changes in my appearance that make me look unattractive',
          'score': 2
        },
        {'text': 'I believe that I look ugly.', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you motivated to do work?',
      'answers': [
        {'text': 'I can work about as well as before. ', 'score': 0},
        {
          'text':
              'It takes an extra effort to get started at doing something. ',
          'score': 1
        },
        {
          'text': 'I have to push myself very hard to do anything. ',
          'score': 2
        },
        {'text': 'I can\'t do any work at all.', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you able to sleep well?',
      'answers': [
        {'text': 'I can sleep as well as usual. ', 'score': 0},
        {'text': 'I don\'t sleep as well as I used to. ', 'score': 1},
        {
          'text':
              'I wake up 1-2 hours earlier than usual and find it hard to get back to sleep. ',
          'score': 3
        },
        {
          'text':
              'I wake up several hours earlier than I used to and cannot get back to sleep. ',
          'score': 3
        },
      ],
    },
    {
      'questionText': 'Are you feeling tired?',
      'answers': [
        {'text': 'I don\'t get more tired than usual. ', 'score': 0},
        {'text': 'I get tired more easily than I used to. ', 'score': 1},
        {'text': 'I get tired from doing almost anything', 'score': 2},
        {'text': 'I am too tired to do anything.', 'score': 3},
      ],
    },
    {
      'questionText': 'How were your eating habits in last 2 weeks?',
      'answers': [
        {'text': 'My appetite is no worse than usual. ', 'score': 0},
        {'text': 'My appetite is not as good as it used to be. ', 'score': 1},
        {'text': 'My appetite is much worse now. ', 'score': 2},
        {'text': 'I have no appetite at all anymore. ', 'score': 3},
      ],
    },
    {
      'questionText': 'Have you lost any weight lately?',
      'answers': [
        {'text': 'I haven\'t lost much weight, if any, lately.', 'score': 0},
        {'text': 'I have lost more than five pounds.', 'score': 1},
        {'text': 'I have lost more than ten pounds.', 'score': 2},
        {'text': 'I have lost more than fifteen pounds.', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you worried about your health more than usual?',
      'answers': [
        {
          'text': 'I am no more worried about my health than usual. ',
          'score': 0
        },
        {
          'text':
              'I am worried about physical problems like aches, pains, upset stomach, or constipation',
          'score': 1
        },
        {
          'text':
              'I am very worried about physical problems and it\'s hard to think of much else. ',
          'score': 2
        },
        {
          'text':
              'I am so worried about my physical problems that I cannot think of anything else.',
          'score': 3
        },
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScoreDepression = 0;

  void _answerQuestionDepression(int score) {
    _totalScoreDepression = _totalScoreDepression + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self test'),
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
      ),
      body: _questionIndex < _questionsDepression.length
          ? Quiz(
              answerQuestion: _answerQuestionDepression,
              questionIndex: _questionIndex,
              questions: _questionsDepression,
            )
          : Result(
              _totalScoreDepression,
            ),
    );
  }
}
