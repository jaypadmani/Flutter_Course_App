import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

void sound(int n) {
  final player = AudioPlayer();
  player.play(AssetSource('note$n.wav'),);
}

Expanded get({Color? color, int? a}) {
  return Expanded(
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color!),
      ),
      child: const Text(''),
      onPressed: () {
        sound(a!);
      },
    ),
  );
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            get(color: Colors.red, a: 1),
            get(color: Colors.yellow, a: 2),
            get(color: Colors.green, a: 3),
            get(color: Colors.orange, a: 4),
            get(color: Colors.teal, a: 5),
            get(color: Colors.blue, a: 6),
            get(color: Colors.purple, a: 7),
          ],
        ),
      ),
    );
  }
}
