import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int images = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Ask Me Anything'),
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('images/ball$images.png'),
                  onPressed: () {
                    setState(() {
                      images = Random().nextInt(5)+1;
                      child:
                      Image.asset('images/ball$images.png');
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
