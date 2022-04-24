import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  static const routeName = '/music-screen';

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  late AudioPlayer _player;
  late AudioCache _cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

  Widget slider() {
    return Container(
      width: 300,
      child: Slider.adaptive(
        value: position.inSeconds.toDouble(),
        max: position.inSeconds.toDouble() + 1,
        onChanged: (value) {
          seekToSec(value.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _cache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen(
      (event) {
        musicLength = event;
      },
    );

    _player.onAudioPositionChanged.listen(
      (event) {
        position = event;
      },
    );

    _cache.load('Weightless.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxing Music'),
        backgroundColor: const Color.fromRGBO(58, 12, 163, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/quote1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                'Song Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              '${position.inMinutes}:${position.inSeconds.remainder(60)}'),
                          slider(),
                          Text(
                              '${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous),
                          iconSize: 45,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            if (!playing) {
                              setState(() {
                                _cache.play('Weightless.mp3');
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(playBtn),
                          iconSize: 45,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next),
                          iconSize: 45,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
