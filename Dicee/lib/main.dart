import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int LeftDiceNumber = 1;
  int RightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text('Dicee'),
          ),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$LeftDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        LeftDiceNumber = Random().nextInt(6) + 1;
                        child:
                        Image.asset('images/dice$LeftDiceNumber.png');
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$RightDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        RightDiceNumber = Random().nextInt(6) + 1;
                        child:
                        Image.asset('images/dice$RightDiceNumber.png');
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
