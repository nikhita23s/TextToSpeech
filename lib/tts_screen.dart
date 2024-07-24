import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSScreen extends StatefulWidget {
  const TTSScreen({super.key});

  @override
  State<TTSScreen> createState() => _TTSScreenState();
}

class _TTSScreenState extends State<TTSScreen> {
  final FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    //Initialize flutter TTS
    _initializeTTS();
    super.initState();
  }

  Future<void> _initializeTTS() async {
    await flutterTts.setLanguage('en-US');
    flutterTts.setStartHandler(() {
      print("TTS Start");
    });

    flutterTts.setCompletionHandler(() {
      print("TTS completion");
    });

    flutterTts.setErrorHandler((message) {
      print("TTS Error : $message");
    });
  }

  Future _speak(String msg) async {
    if (msg.isNotEmpty) {
      flutterTts.speak(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text To Speech"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: "Enter text here"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _speak(textController.text);
                  },
                  child: const Text("Speak"))
            ],
          ),
        ));
  }
}
