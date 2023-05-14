import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:retrofitapi_flutter/pages/detailAlbumb/audio_provider_viewmodel.dart';

enum PlayerState { stopped, playing, paused, STOPPED }

class SoundView extends StatelessWidget {
  const SoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<AudioProvider>(
              builder: (context, audioProvider, child) {
                return Slider(
                  value: audioProvider.position.inSeconds.toDouble(),
                  max: 237,
                  onChanged: (value) {
                    audioProvider.seek(Duration(seconds: value.toInt()));
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          // Provider.of<AudioProvider>(context, listen: false).playPause();
        },
        child:
        Consumer<AudioProvider>(
          builder: (context, audioProvider, child) {
            if(audioProvider.audioPlayerState == PlayerState.playing) {
              return const Icon( Icons.pause);

            } else {
              return const Icon(Icons.play_arrow);
            }
            }
        ),
      ),
    );
  }
}
