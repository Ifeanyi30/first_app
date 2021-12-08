import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';

class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // the list of maps
  static const _question = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Bird', 'score': 1},
        {'text': 'Cat', 'score': 3},
        {'text': 'Monkey', 'score': 5}
      ]
    },
    {
      'questionText': 'What is your favorite sport?',
      'answers': [
        {'text': 'Football', 'score': 1},
        {'text': 'Basketbal', 'score': 3},
        {'text': 'Tennis', 'score': 5},
        {'text': 'Hockey', 'score': 10}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _questionIndex < _question.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              question: _question,
              questionIndex: _questionIndex,
            )
          : Result(
              resultScore: _totalScore,
              restartQuiz: _restartQuiz,
            ),
    );
  }
}
