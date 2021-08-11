import 'package:flutter/material.dart';
import './transaction.dart';
import 'displaylist/priceDisplay.dart';
import 'displaylist/titleDisplay.dart';
import 'displaylist/dateDisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 55.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New shirt',
      amount: 44.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Jeans',
      amount: 15.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: transactions.map((e) {
                  return Card(
                    child: Row(children: <Widget>[
                      PriceDisplay(
                        amount: e.amount,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TitleDisplay(title: e.title),
                          DateDisplay(date: e.date),
                        ],
                      ),
                    ]),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
