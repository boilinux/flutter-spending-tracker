import 'package:flutter/material.dart';
import './priceDisplay.dart';
import './titleDisplay.dart';
import './dateDisplay.dart';
import '../../models/transaction.dart';

class DisplayList extends StatelessWidget {
  final List<Transaction> transactions;
  DisplayList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        // child: SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       transactions.map((e) {
        //         return Card(
        //           child: Row(children: [
        //             PriceDisplay(
        //               amount: e.amount,
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 TitleDisplay(title: e.title),
        //                 DateDisplay(date: e.date),
        //               ],
        //             ),
        //           ]),
        //         );
        //       }).toList(),
        //     ],
        //   ),
        // ),
        );
  }
}
