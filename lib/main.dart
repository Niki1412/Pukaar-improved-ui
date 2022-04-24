import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mental_health_app/relaxing%20music/music_screen.dart';
import 'package:mental_health_app/sleep/sleep.dart';
import './doctor/chat_doctor.dart';
import 'doctor/doctor.dart';
import './screens/rewards_screen.dart';
import './doctor/tabs_screen_doctor.dart';
import './screens/tools/games/games_screen.dart';
import './screens/tools/games/slide%20puzzle/board.dart';

import './screens/tools/games/wordle/wordlescreen.dart';
import './widgets/login.dart';
import './screens/tabs_screen.dart';
import './screens/home_page.dart';
import './screens/self%20test/self_test.dart';
import './screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        Sleep.routeName: (ctx) => Sleep(),
        GamesScreen.routeName: (ctx) => GamesScreen(),
        SelfTest.routeName: (ctx) => SelfTest(),
        Rewards.routeName: (ctx) => Rewards(),
        ChatScreen.routeName: (ctx) => ChatScreen(),
        Board.routeName: (ctx) => Board(),
        DoctorScreen.routeName: (ctx) => DoctorScreen(),
        ChatDoctorScreen.routeName: (ctx) => const ChatDoctorScreen(),
        WordleScreen.routeName: (ctx) => const WordleScreen(),
        TabsScreenDoctor.routeName: (ctx) => const TabsScreenDoctor(),
        MusicScreen.routeName: (ctx) => MusicScreen(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              body: Login(),
            ),
          ],
        ),
      ),
    );
  }
}
