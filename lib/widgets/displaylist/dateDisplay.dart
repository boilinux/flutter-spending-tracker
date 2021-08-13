import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  const DateDisplay({required this.date}) : assert(date != null);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMEd().format(date),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}
