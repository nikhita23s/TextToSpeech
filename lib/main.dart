import 'package:flutter/material.dart';
import 'package:text_to_speech_example/tts_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TextToSpeech",
      home: TTSScreen(),
    );
  }
}