import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

List<String> Question = [
  'Some cats are actually allergic to humans',
  'You can lead a cow down stairs but not up stairs.',
  'Approximately one quarter of human bones are in the feet.',
  'A slug\'s blood is green.',
  'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
  'It is illegal to pee in the Ocean in Portugal.',
  'No piece of square dry paper can be folded in half more than 7 times.',
  'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
  'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
  'The total surface area of two human lungs is approximately 70 square metres.',
  'Google was originally called \"Backrub\".',
  'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
  'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
];

List<bool> answer = [
  true,
  false,
  true,
  true,
  true,
  true,
  false,
  true,
  false,
  true,
  true,
  true,
  true,
];

List<Icon> finalanswer = [];

void checkAnswer({bool? p, int? q}) {
  if (answer[q!] == p!) {
    finalanswer.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  } else {
    finalanswer.add(
      const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }
}

bool finished({int? q}) {
  if (q! < Question.length - 1) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Quizzer(),
          ),
        ),
      ),
    );
  }
}

class Quizzer extends StatefulWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  State<Quizzer> createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  int number = 0;
  bool answer = true;

  void clean() {
    number = 0;
    answer = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.black,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  Question[number],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(p: true, q: number);
                  answer = finished(q: number);
                  number++;
                  if (answer == false) {
                    Alert(
                            image: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  Image.asset('images/checked.png').image,
                            ),
                            context: context,
                            title: "Finished",
                            desc: "Restart the Quiz")
                        .show();

                    finalanswer = [];

                    clean();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(p: false, q: number);
                  answer = finished(q: number);
                  number++;
                  if (answer == false) {
                    Alert(
                      image: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            Image.asset('images/checked.png').image,
                      ),
                      context: context,
                      title: "Finished",
                      desc: "Restart the Quiz",
                    ).show();

                    finalanswer = [];

                    clean();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: finalanswer,
        ),
      ],
    );
  }
}
