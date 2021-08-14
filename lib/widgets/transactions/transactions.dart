import 'package:flutter/material.dart';
import '../displaylist/dateDisplay.dart';
import '../displaylist/priceDisplay.dart';
import '../displaylist/titleDisplay.dart';
import '../form/actionlist.dart';

class Transactions extends StatelessWidget {
  final List transactions;
  final Function deleteActionHandler;

  const Transactions(
      {required this.transactions, required this.deleteActionHandler});

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
                      amount: transactions[index].amount.toStringAsFixed(2),
                    ),
                    title: TitleDisplay(title: transactions[index].title),
                    subtitle: DateDisplay(date: transactions[index].date),
                    trailing: ActionList(
                        id: transactions[index].id,
                        deleteTransactionHandler: deleteActionHandler)),
              );
            },
            itemCount: transactions.length,
          ),
        ),
      ],
    );
  }
}
