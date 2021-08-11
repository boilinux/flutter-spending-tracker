import 'package:flutter/material.dart';
// import '../displaylist/displaylist.dart';
import '../../models/transaction.dart';
import '../form/formspending.dart';
import '../chart/chart.dart';
import '../displaylist/dateDisplay.dart';
import '../displaylist/priceDisplay.dart';
import '../displaylist/titleDisplay.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _transactions = [
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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitFormSpending() {
    setState(() {
      _transactions.add(
        Transaction(
          id: 't4',
          title: titleController.text,
          amount: double.parse(amountController.text),
          date: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          FormSpending(
            inputTitleController: titleController,
            inputAmountController: amountController,
            submitFormHandler: _submitFormSpending,
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: _transactions.map((e) {
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
    );
  }
}
