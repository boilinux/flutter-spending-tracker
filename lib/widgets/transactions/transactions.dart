import 'package:flutter/material.dart';
import '../displaylist/dateDisplay.dart';
import '../displaylist/priceDisplay.dart';
import '../displaylist/titleDisplay.dart';

class Transactions extends StatelessWidget {
  final List _transactions;

  const Transactions(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Chart(),
        Container(
          height: 800,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (e, index) {
              return Card(
                child: Row(
                  children: <Widget>[
                    PriceDisplay(
                      amount: _transactions[index].amount.toStringAsFixed(2),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TitleDisplay(title: _transactions[index].title),
                        DateDisplay(date: _transactions[index].date),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: _transactions.length,
          ),
        ),
      ],
    );
  }
}
