import 'dart:io';

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 9},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Purple', 'score': 5},
      ],
    },
    {
      'questionText': 'What is your favorite car?',
      'answers': [
        {'text': 'Bugatti', 'score': 10},
        {'text': 'Toyota', 'score': 6},
        {'text': 'Lexus', 'score': 7},
        {'text': 'Porsche', 'score': 9},
        {'text': 'Mercedes Benz', 'score': 8},
      ],
    },
    {
      'questionText': 'What is your favorite programming language?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'Golang', 'score': 6},
        {'text': 'JavaScript', 'score': 7},
        {'text': 'Java', 'score': 9},
        {'text': 'C++', 'score': 8},
      ],
    }
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswer(int score) {
    _totalScore += score;

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
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _questionAnswer,
                questions: questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
