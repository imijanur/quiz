import 'package:flutter/material.dart';
import 'package:kite/quiz.dart';
import 'package:kite/result.dart';

void main() {
  runApp(ZeroKite());
}

class ZeroKite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZeroKiteState();
  }
}

class _ZeroKiteState extends State<ZeroKite> {
  final _questions = const [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Snake', 'score': 1},
      ],
    },
    {
      "questionText": "Who's your favorite instructor ?",
      "answers": [
        {'text': 'Mijanur', 'score': 10},
        {'text': 'Rubi', 'score': 5},
        {'text': 'Anuara', 'score': 3},
        {'text': 'Rahaman', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){

    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore +=score;
    _questionIndex++;
    setState(() {});
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("Next Question");
    } else {
      print("No more Questions!");
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kite"),
        ),
        body: _questionIndex<_questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
        debugShowCheckedModeBanner: false
    );
  }
}
