import 'package:QuizApp/widget/answer.dart';
import 'package:QuizApp/widget/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function questionAnswer;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.questionAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => questionAnswer(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
