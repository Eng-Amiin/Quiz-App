import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({Key? key, required this.correct, required this.wrong})
      : super(key: key);
  final int correct;
  final int wrong;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('THE Corect Answer Is  : $correct',style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 20,),
            Text('The Wrong Answer Is    $wrong',style: TextStyle(fontSize: 30,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}