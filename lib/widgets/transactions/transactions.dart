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
        Container(
          padding: EdgeInsets.all(3),
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (e, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: PriceDisplay(
                    amount: _transactions[index].amount.toStringAsFixed(2),
                  ),
                  title: TitleDisplay(title: _transactions[index].title),
                  subtitle: DateDisplay(date: _transactions[index].date),
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
