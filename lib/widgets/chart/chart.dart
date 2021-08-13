import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  final List recentTransactions;
  Chart({required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionVal {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = 0.0;

      for (var count = 0; count < recentTransactions.length; count++) {
        if (recentTransactions[count].date.day == weekDay.day &&
            recentTransactions[count].date.month == weekDay.month &&
            recentTransactions[count].date.year == weekDay.year) {
          sum += recentTransactions[count].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionVal.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          children: groupedTransactionVal.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: e['day'].toString(),
                  amount: double.parse(e['amount'].toString()),
                  total: totalSpending == 0.0
                      ? 0.0
                      : (e['amount'] as double) / totalSpending),
            );
          }).toList(),
        ));
  }
}
