import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

var questions = [
  "What is your favorite color?",
  "What is your favorite car?",
  "What is your favorite movie?",
  "What is your favorite programming language?"
];
void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _questionAnswer() {
    setState(() {
      _questionIndex++;
    });
    print(questions[_questionIndex]);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            Answer(_questionAnswer),
            Answer(_questionAnswer),
            Answer(_questionAnswer),
          ],
        ),
      ),
    );
  }
}
