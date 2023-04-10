import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  final Key? key;

  Answer(this.selectHandler, this.answerText, {this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
