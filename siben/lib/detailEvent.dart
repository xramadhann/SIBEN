import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({Key? key}) : super(key: key);

  @override
  _DetailEventState createState() => _DetailEventState();
}

AudioPlayer _player = AudioPlayer(); // Create an audio player instance

class _DetailEventState extends State<DetailEvent> {
  String audioUrl =
      "http://commondatastorage.googleapis.com/codeskulptor-assets/Collision8-Bit.ogg"; // Replace with your actual audio URL

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var urlSource = UrlSource(audioUrl);
        await _player.play(urlSource);
      },
      child: const Text("data"),
    );
  }
}
