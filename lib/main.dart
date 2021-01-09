import 'package:QuizApp/widget/quiz.dart';
import 'package:QuizApp/widget/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What is your fav color?",
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 6},
        {'text': 'White', 'score': 9}
      ],
    },
    {
      'questionText': "What is your fav animal?",
      'answers': [
        {'text': 'Dog', 'score': 8},
        {'text': 'Cat', 'score': 7},
        {'text': 'Lion', 'score': 4},
        {'text': 'Giraffe', 'score': 3}
      ],
    },
    {
      'questionText': "What is your fav food?",
      'answers': [
        {'text': 'Momo', 'score': 1},
        {'text': 'Sweets', 'score': 0},
        {'text': 'Pizza', 'score': 2},
        {'text': 'Burger', 'score': 9}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswer(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionAnswer: _questionAnswer,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
