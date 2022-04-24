import 'package:flutter/material.dart';
import 'package:mental_health_app/sleep/sleep.dart';
import 'package:mental_health_app/sleep/sleep_graph.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> quotes = [
    "You say you are depressed, all I see is resilience. You are allowed to feel messed up and inside out. It doesn't mean you are defective, it just means you are human.",
    "You're like a grey sky.You're beautiful, even though you don't want to be.",
    "Even for me life had its gleams of sunshine.",
    "You must hold your quiet center, where you do what only you can do.",
    "Every man has his secret sorrows which the world knows not; and often times we call a man cold when he is only sad.",
    "Anxiety's like a rocking chair. It gives you something to do, but it doesn't get you very far.",
    "'Hope' is the thing with feathers that perches in the soul and sings the tune without the words and never stops at all.",
    "Dance until your bones clatter. What a prize you are. What a lucky sack of stars.",
    "Man is not worried by real problems so much as by his imagined anxieties about real problems.",
    "If you want to conquer the anxiety of life, live in the moment, live in the breath.",
    "Life is 10 percent what you experience and go percent how you respond to it.",
    "Anxiety is the dizziness of freedom.",
  ];

  @override
  void initState() {
    quotes.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Sleep.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sleep',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //  Icon(Icons.bedtime),
                      SleepGraph(),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(172, 195, 235, 1),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'How is Your Mood Today?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Good ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: '😁',
                                style: TextStyle(
                                  fontFamily: 'EmojiOne',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(14, 49, 217, 1),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Fine ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '😊',
                              style: TextStyle(
                                fontFamily: 'EmojiOne',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(14, 49, 217, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Irritated ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: '😒',
                                style: TextStyle(
                                  fontFamily: 'EmojiOne',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(14, 49, 217, 1),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Frustrated ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '😣',
                              style: TextStyle(
                                fontFamily: 'EmojiOne',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(14, 49, 217, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sad ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: '😕',
                                style: TextStyle(
                                  fontFamily: 'EmojiOne',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(14, 49, 217, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: 100,
                    color: const Color.fromRGBO(72, 149, 255, 1),
                    child: const Center(
                      child: Text(
                        'Daily Exercise Reminder',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: 120,
                    color: const Color.fromRGBO(72, 149, 255, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          quotes[0].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
