import 'package:flutter/material.dart';
import './transaction.dart';
import 'displaylist/priceDisplay.dart';
import 'displaylist/titleDisplay.dart';
import 'displaylist/dateDisplay.dart';
import 'chart/chart.dart';
import 'form/formspending.dart';

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

  var _titleInput;
  var _amountInput;

  void _titleInputFunc(String titleInput) {
    setState(() {
      _titleInput = titleInput;
    });
  }

  void _amountInputFunc(String amountInput) {
    _amountInput = amountInput;
    setState(() {
      _amountInput = amountInput;
    });
  }

  void _submitFormSpending() {
    print(_titleInput);
    print(_amountInput);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(),
            FormSpending(
              inputTitleHandler: _titleInputFunc,
              inputAmountHandler: _amountInputFunc,
              submitFormHandler: _submitFormSpending,
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
