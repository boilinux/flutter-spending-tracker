import 'package:flutter/material.dart';

class DateDisplay extends StatelessWidget {
  const DateDisplay({required this.date}) : assert(date != null);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      // margin: EdgeInsets.symmetric(
      //   vertical: 10,
      //   horizontal: 15,
      // ),
      child: Text(
        date.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
