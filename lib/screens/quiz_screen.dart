import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/quiz.dart';
import '/result.dart';
import '/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  final _questions = [
    {
      'questionText': 'Welcome to the Mental Heath Assessment Quiz',
      'answers': [
        {'text': 'Start Quiz', 'score': 0},
      ],
    },
    {
      'questionText': 'Q1. Little interest or pleasure in doing things',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText': 'Q2. Feeling down, depressed, or hopeless',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q3. Trouble falling or staying asleep, or sleeping too much',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText': 'Q4. Feeling tired or having little energy',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText': 'Q5. Poor appetite or overeating',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q6. Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q7. Moving or speaking so slowly that other people could have noticed , Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q8. How often do you share your problems with your teachers?',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q9. Thoughts that you would be better off dead, or of hurting yourself?',
      'answers': [
        {'text': ' Not at all', 'score': 5},
        {'text': 'several days', 'score': 4},
        {'text': 'more than half the days', 'score': 3},
        {'text': 'nearly everyday', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q10. If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?',
      'answers': [
        {'text': ' Not difficult at all', 'score': 5},
        {'text': 'somewhat difficult', 'score': 4},
        {'text': 'very difficult', 'score': 3},
        {'text': 'extremely difficult', 'score': 2}
        //{'text': '1 Point', 'score': 1}
      ],
    },
    /*{
      'questionText':
          'Q11. How often do you face bullying or discrimination in your school?',
      'answers': [
        {'text': 'Never', 'score': 5},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Frequently', 'score': 2},
        {'text': 'Always', 'score': 1}
      ],
    },
    {
      'questionText': 'Q12. To what extent do you feel safe in your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'School Management\n\nQ13. How satisfied are you with the sanitation facilities available in your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q14 .How satisfied are you with the facilities like Canteen/Mid-Day Meal, Potable Drinking Water,  Library, Playground provided by your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q15 .How effectively are you able to convey your problems to the school management?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    */
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  int teaching = 0;
  int stRel = 0;

  int peers = 0;

  int schMan = 0;

  void _answerQuestion(int score) {
    _totalScore = score + _totalScore;
    switch (_questionIndex) {
      case 0:
        break;
      case 1:
        teaching = score;
        break;
      case 2:
        teaching = score;
        break;
      case 3:
        teaching = score;
        break;
      case 4:
        teaching = score;
        break;
      case 5:
        teaching = score;
        break;
      case 6:
        stRel = score;
        break;
      case 7:
        stRel = score;
        break;
      case 8:
        stRel = score;
        break;
      case 9:
        peers = score;
        break;
      case 10:
        peers = score;
        break;
      case 11:
        peers = score;
        break;
      case 12:
        peers = score;
        break;
      case 13:
        schMan = score;
        break;
      case 14:
        schMan = score;
        break;
      case 15:
        schMan = score;
        break;
    }

    setState(() {
      _questionIndex = _questionIndex + 1;

      avgTeaching = avgTeaching + teaching;

      avgstRel += stRel;

      avgPeers += peers;

      avgschMan += schMan;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print(avgTeaching / 15);
      print(avgPeers / 7);
      print(avgstRel / 10);
      print(avgschMan / 3);
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Avyukt"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFDD83AD), Color(0xFFB4D6F4)])),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }

  void onPressed() {}
}
