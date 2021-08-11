import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  const PriceDisplay({required this.amount}) : assert(amount != null);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Text(
        amount.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.purple,
        ),
      ),
    );
  }
}
