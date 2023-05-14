import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class MusicTest extends StatefulWidget {
  const MusicTest({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MusicTest> {

  AudioCache audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );
  late AudioPlayer audioPlayer;
  Duration duration = const Duration();
  Duration durations = Duration();
  Duration position = Duration();



  @override
  void initState() {
    super.initState();
    // Load bài hát
    audioCache.load('Infinity.mp3');
  }

  @override
  void dispose() {
    super.dispose();
    // Giải phóng bộ nhớ
    audioPlayer?.dispose();
  }

  void initAudio() async {
    await audioCache.load('Infinity.mp3');
    audioPlayer = await audioCache.play('Infinity.mp3');

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
      audioPlayer.onAudioPositionChanged.listen((Duration p) {
        setState(() {
          position = p;
        });
      });
  }



  void _playSong() async {
    // Phát bài hát
    audioPlayer = await audioCache.play('Infinity.mp3');
    duration = (await audioPlayer.getDuration()) as Duration;

  }
  String getDurationString() {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  void _Songnext() async {
    // Phát bài hát
    audioPlayer = await audioCache.play('waveform.mp3');
  }
  void _stopSong() {
    // Dừng bài hát
    audioPlayer?.stop();
  }
  void _pauseSong() {
    // Dừng bài hát
    audioPlayer?.pause();
  }
  void _resumeSong() {
    // Dừng bài hát
    audioPlayer?.resume();
  }
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDuration(position),
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              formatDuration(duration),
              style: TextStyle(fontSize: 16.0),
            ),
            Center(
            child: Text(getDurationString()),
          ),
            ElevatedButton(
              onPressed: initAudio,
              child: const Text('Play Song'),
            ),
            ElevatedButton(
              onPressed: _Songnext,
              child: const Text('Play Song next'),
            ),
            ElevatedButton(
              onPressed: _pauseSong,
              child: const Text('pause Song'),
            ),
            ElevatedButton(
              onPressed: _resumeSong,
              child: const Text('resume Song'),
            ),
            ElevatedButton(
              onPressed: _stopSong,
              child: const Text('Stop Song'),
            ),
          ],
        ),
      ),
    );
  }
}
