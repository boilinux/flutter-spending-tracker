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
                  // children: <Widget>[
                  //   PriceDisplay(
                  //     amount: _transactions[index].amount.toStringAsFixed(2),
                  //   ),
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       TitleDisplay(title: _transactions[index].title),
                  //       DateDisplay(date: _transactions[index].date),
                  //     ],
                  //   ),
                  // ],
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
