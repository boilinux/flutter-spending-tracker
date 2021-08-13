import 'package:flutter/material.dart';

class PriceDisplay extends StatelessWidget {
  const PriceDisplay({required this.amount});

  final String amount;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: FittedBox(
          child: Text('\$${amount}'),
        ),
      ),
    );
  }
}
