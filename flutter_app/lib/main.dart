import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

var questions = [
  {
    'questionText': 'What is your favorite color?',
    'answers': ['Black', 'White', 'Red', 'Green', 'Purple'],
  },
  {
    'questionText': 'What is your favorite car?',
    'answers': ['Bugatti', 'Toyota', 'Lexus', 'Porsche', 'Mercedes Benz'],
  },
  {
    'questionText': 'What is your favorite movie?',
    'answers': ['Spider Man', 'Thor', 'Marvel', 'Harry Potter', 'GOT'],
  },
  {
    'questionText': 'What is your favorite programming language?',
    'answers': ['Dart', 'Golang', 'JavaScript', 'C++', 'Java'],
  }
];

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _questionAnswer() {
    setState(() {
      _questionIndex++;
    });
    print(questions[_questionIndex]['questionText']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'].toString(),
            ),
            ...(questions[_questionIndex]['answers'] as List<dynamic>)
                .map((answer) {
              return Answer(_questionAnswer, answer.toString());
            }).toList(),
          ],
        ),
      ),
    );
  }
}
