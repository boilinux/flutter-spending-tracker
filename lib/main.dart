import 'package:flutter/material.dart';
import './widgets/transactions/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int ndex = 0;
  final List questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'red', 'score': 3},
        {'text': 'blue', 'score': 7},
        {'text': 'black', 'score': 0},
        {'text': 'green', 'score': 13},
        {'text': 'orange', 'score': 23},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Transactions(),
      ),
    );
  }
}
