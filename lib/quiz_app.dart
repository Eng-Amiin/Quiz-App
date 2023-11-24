import 'package:flutter/material.dart';
import 'package:quiz_project/questions.dart';

import 'package:quiz_project/result.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Question> questions = [
    Question(
        q: 'Flutter is best framework in mobile application development',
        a: true),
    Question(q: 'in flutter samicolon is is not must', a: false),
    Question(q: 'flutter was released in 2017', a: true),
  ];







  List<Widget> IconsMade = [];
  int questionIndex = 0;
  int correctAnswers = 0;
  // final ? isCorrect;
  int falseAnswers = 0;


void checkAnswer(bool ans) {

  bool correctAnswer = questions[questionIndex].questionAnswer!;
  setState(() {

    if (ans == correctAnswer) {
      IconsMade.add(Icon(Icons.check, color: Colors.green,));

    }
    else {
      IconsMade.add(Icon(Icons.close, color: Colors.red,));
    }

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081c15),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questions[questionIndex].questionName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 2.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                           
                           final isCorrect = questions[questionIndex].questionAnswer;

                        if (isCorrect == true) {

                        IconsMade.add(Icon(Icons.check,color: Colors.green,));
                          setState(() {
                            correctAnswers = correctAnswers + 1;
                          });
                        } else {
                    
                          setState(() {
                            falseAnswers = falseAnswers + 1;
                          });
                        }
                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex++;
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                    correct: correctAnswers,
                                    wrong: falseAnswers),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        final isFalse = questions[questionIndex].questionAnswer;

                        if (isFalse == false) {
                            IconsMade.add(Icon(Icons.close,color: Colors.green,));
                       
                          setState(() {
                            correctAnswers = correctAnswers + 1;
                          });
                        } else {
                        
                          setState(() {
                            falseAnswers = falseAnswers + 1;
                          });
                        }
                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex++;
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Result(
                                    correct: correctAnswers,
                                    wrong: falseAnswers,
                                  );
                                },
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 100,
            width: 400,
            child: Row(
              children: [  

              

              ],
            ),
          )
        ],
      ),
    );
  }
}


