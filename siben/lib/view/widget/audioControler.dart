import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControls extends StatefulWidget {
  const AudioControls({Key? key, required this.audioPath}) : super(key: key);
  final String audioPath;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  final player = AudioPlayer();

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void reset() {
    player.seek(Duration.zero);

    setState(() {
      player.stop();
    });
  }

  void handleLoop() {
    setState(() {
      if (player.loopMode == LoopMode.one) {
        player.setLoopMode(LoopMode.off);
      } else {
        player.setLoopMode(LoopMode.one);
      }
    });
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio(widget.audioPath);
  }

  Future<void> _initAudio(String path) async {
    try {
      await player.setAsset(path);
      player.positionStream.listen((p) {
        setState(() => position = p);
      });

      player.durationStream.listen((d) {
        setState(() => duration = d ?? Duration.zero);
      });

      player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            position = Duration.zero;
          });
          player.pause();
          player.seek(position);
        }
      });
    } catch (e) {
      // Handle audio asset load error
    }
  }

  @override
  void didUpdateWidget(covariant AudioControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioPath != widget.audioPath) {
      _initAudio(widget.audioPath);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color.fromARGB(255, 239, 239, 239),
      ),
      height: 100,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: reset,
                iconSize: 30,
                color: const Color(0xFFFEB52B),
              ),
              IconButton(
                icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
                onPressed: handlePlayPause,
                iconSize: 30,
                color: const Color(0xFFFEB52B),
              ),
              IconButton(
                icon: Icon(
                  player.loopMode == LoopMode.one
                      ? Icons.repeat_one
                      : Icons.repeat,
                ),
                onPressed: handleLoop,
                iconSize: 30,
                color: const Color(0xFFFEB52B),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(formatDuration(position)),
              Expanded(
                child: Slider(
                  min: 0,
                  thumbColor: const Color(0xFFFEB52B),
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: handleSeek,
                ),
              ),
              Text(
                formatDuration(duration),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
